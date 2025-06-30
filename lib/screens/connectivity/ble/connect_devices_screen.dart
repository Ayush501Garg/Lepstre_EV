// File: connect_devices_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/text_style.dart';

import '../../../core/constants/app_sizing.dart';
import '../../../widgets/custom_back_buttom.dart';
import '../../../widgets/custom_toast.dart';

class ConnectDevicesScreen extends StatefulWidget {
  const ConnectDevicesScreen({super.key});

  @override
  State<ConnectDevicesScreen> createState() => _ConnectDevicesScreenState();
}

class _ConnectDevicesScreenState extends State<ConnectDevicesScreen> {
  final List<ScanResult> _scannedDevices = [];
  bool _isScanning = false;
  BluetoothDevice? _connectedDevice;
  ScanResult? _connectedScanResult; // ✅ to show RSSI

  @override
  void initState() {
    super.initState();
    _stopScanOnStart();
  }

  void _stopScanOnStart() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> _requestPermissionsAndScan() async {
    debugPrint("Requesting permissions...");

    final bluetoothScan = await Permission.bluetoothScan.request();
    final bluetoothConnect = await Permission.bluetoothConnect.request();
    final location = await Permission.locationWhenInUse.request();

    if (bluetoothScan.isGranted &&
        bluetoothConnect.isGranted &&
        location.isGranted) {
      debugPrint("All permissions granted");
      final isOn = await FlutterBluePlus.isOn;
      if (!isOn) {
        showCustomToast(
          context: context,
          message: "Please turn on Bluetooth to scan.",
          type: ToastType.error,
        );
      } else {
        _startScan();
      }
    } else {
      showCustomToast(
        context: context,
        message: "Bluetooth & Location permissions are required.",
        type: ToastType.error,
      );

      debugPrint(
        "Permissions not granted: Scan: $bluetoothScan, Connect: $bluetoothConnect, Location: $location",
      );
    }
  }

  void _startScan() async {
    _scannedDevices.clear();
    setState(() => _isScanning = true);

    try {
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 6));
      FlutterBluePlus.scanResults.listen((results) {
        for (var result in results) {
          if (!_scannedDevices.any((d) => d.device.id == result.device.id)) {
            setState(() => _scannedDevices.add(result));
          }
        }
      });
    } catch (e) {
      showCustomToast(
        context: context,
        message: "Scan error: ${e.toString()}",
        type: ToastType.error,
      );
    } finally {
      await Future.delayed(const Duration(seconds: 6));
      print("Scanned devices 123: $_scannedDevices");
      setState(() => _isScanning = false);
    }
  }

  void _connectToDevice(ScanResult result) async {
    Navigator.pop(context);
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      await result.device.connect(
        autoConnect: false,
        timeout: const Duration(seconds: 8),
      );

      if (mounted) Navigator.pop(context);

      setState(() {
        _connectedDevice = result.device;
        _connectedScanResult = result; // ✅ Store RSSI too
      });
      showCustomToast(
        context: context,
        message:
            "Connected to ${result.device.name.isNotEmpty ? result.device.name : 'Device'}",
        type: ToastType.success,
      );
    } catch (e) {
      if (mounted) Navigator.pop(context);
      showCustomToast(
        context: context,
        message: 'Connection failed',
        type: ToastType.error,
      );
    }
  }

  void _showDevicesBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        final filteredDevices = _scannedDevices
            .where((device) => device.device.name.isNotEmpty)
            .toList();

        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nearby Devices", style: blackText16600),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: filteredDevices.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.bluetooth_disabled,
                                size: 60,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 10),
                              Text("No devices found", style: greyText14600),
                            ],
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredDevices.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final device = filteredDevices[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: AppColors.primaryLightColor.withOpacity(
                                  0.1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.bluetooth,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  device.device.name,
                                  style: blackText14600,
                                ),
                                subtitle: Text(
                                  device.device.id.id,
                                  style: greyText12400,
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    _connectToDevice(device);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Connect",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConnectedDeviceCard() {
    if (_connectedDevice == null) return const SizedBox();

    final rssi = _connectedScanResult?.rssi;
    final signalIcon = rssi != null
        ? rssi >= -60
              ? Icons.wifi
              : rssi >= -80
              ? Icons.bluetooth_disabled
              : Icons.bluetooth_connected
        : Icons.bluetooth_connected;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(signalIcon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _connectedDevice!.name.isNotEmpty
                      ? _connectedDevice!.name
                      : "Unnamed Device",
                  style: blackText14600,
                ),
                const SizedBox(height: 4),
                Text(_connectedDevice!.id.id, style: greyText12400),
                if (rssi != null)
                  Text("Signal Strength: $rssi dBm", style: greyText12400),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.red),
            onPressed: () async {
              try {
                await _connectedDevice!.disconnect();
                setState(() {
                  _connectedDevice = null;
                  _connectedScanResult = null;
                });
                showCustomToast(
                  context: context,
                  message: 'Device disconnected',
                  type: ToastType.error,
                );
              } catch (e) {
                showCustomToast(
                  context: context,
                  message: 'Error: ${e.toString()}',
                  type: ToastType.error,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              verticalSpacing(15),
              Row(
                children: [
                  customBackButton(
                    context: context,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  horizontalSpacing(15),
                  Text("Connect Device", style: blackText18600),
                ],
              ),
              verticalSpacing(100),
              _buildConnectedDeviceCard(), // ✅ Show connected device info
              ElevatedButton.icon(
                onPressed: _isScanning ? null : _requestPermissionsAndScan,
                icon: Icon(
                  _isScanning ? Icons.bluetooth_searching : Icons.bluetooth,
                  color: Colors.white,
                ),
                label: Text(
                  _isScanning ? "Scanning..." : "Scan Devices",
                  style: whiteText14600,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _showDevicesBottomSheet,
                icon: const Icon(Icons.devices, color: Colors.white),
                label: Text("Show Nearby Devices", style: whiteText14600),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
