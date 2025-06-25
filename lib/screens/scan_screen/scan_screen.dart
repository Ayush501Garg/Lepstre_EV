import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with TickerProviderStateMixin {
  bool isScanning = false;
  bool flashOn = false;
  String scannedCode = '';
  late final AnimationController _lineController;

  final MobileScannerController _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  @override
  void initState() {
    super.initState();
    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _lineController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull;
    if (barcode == null) return;

    final value = barcode.rawValue;
    if (value != null && scannedCode != value) {
      setState(() {
        scannedCode = value;
        isScanning = false;
      });
    }
  }

  void _toggleScan() {
    setState(() {
      isScanning = !isScanning;
      scannedCode = '';
    });
  }

  void _toggleFlash() async {
    await _scannerController.toggleTorch();
    setState(() {
      flashOn = !flashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scanBoxSize = screenWidth(context) * 0.65;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: screenHeight(context) * 0.5,
            child: isScanning
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      MobileScanner(
                        controller: _scannerController,
                        onDetect: _onDetect,
                      ),
                      Container(
                        width: scanBoxSize,
                        height: scanBoxSize,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryLightColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _lineController,
                        builder: (_, __) {
                          return Positioned(
                            top: scanBoxSize * _lineController.value,
                            child: Container(
                              width: scanBoxSize,
                              height: 2,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Scanning...", style: whiteText16600),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 80,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(height: 16),
                        Text("Start scanning", style: blackText18600),
                      ],
                    ),
                  ),
          ),

          // Bottom half
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _toggleScan,
                          icon: Icon(
                            isScanning ? Icons.close : Icons.qr_code,
                            color: AppColors.whiteColor,
                          ),
                          label: Text(
                            isScanning ? "Stop Scan" : "Start Scan",
                            style: whiteText14600,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      customBackButton(
                        onTap: () {
                          _toggleFlash();
                        },
                        bgColor: AppColors.primaryColor,
                        iconColor: AppColors.whiteColor,
                        isShadow: false,
                        icon: flashOn ? Icons.flash_on : Icons.flash_off,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (scannedCode.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreenColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.device_hub, color: Colors.green),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Connected to device: $scannedCode",
                              style: greyText14600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Device Info", style: blackText16600),
                            const SizedBox(height: 8),
                            Text(
                              "Device ID: $scannedCode",
                              style: greyText14600,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Connection Status: Connected",
                              style: greyText14600,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Scan Time: ${DateTime.now().toLocal()}",
                              style: greyText14600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else
                    Center(
                      child: Text(
                        "Scan a device QR to connect",
                        style: greyText14600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
