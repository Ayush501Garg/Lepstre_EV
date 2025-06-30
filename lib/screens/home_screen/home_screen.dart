import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../widgets/custom_slider.dart';
import '../connectivity/ble/connect_devices_screen.dart';
import '../connectivity/ble/device_connect_card.dart';
import '../../data/data.dart';
import 'lock_ev_screen.dart';
import 'widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20),
              buildHeader(context),
              verticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomImageSlider(imagePaths: sliderImages),
              ),
              // _buildFullWidthBuyEVSection(),
              verticalSpacing(10),
              DeviceConnectivityCard(
                icon: Icons.bluetooth_connected,
                title: "Device Connection",
                subtitle: "Tap to scan & connect nearby devices",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ConnectDevicesScreen()),
                  );
                },
              ),
              verticalSpacing(10),
              StartStopEVCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LockEvDetailScreen(),
                    ),
                  );
                },
              ),

              buildSpeedLockSection(context),

              buildLockEvFeatureSection(context),

              BatteryInfoCard(batteryPercentage: 0.2, rangeKm: 180),
              verticalSpacing(15),
              buildFeatureIcons(context),
              verticalSpacing(5),
              buildChargingStationSection(context),
              buildAdvancedSection(context),
              verticalSpacing(10),
              buildNewReleasesSection(context),
              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }
}
