import 'package:flutter/material.dart';
import 'package:lepster/a.dart';
import 'package:lepster/screens/plans/plan_screen.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../widgets/custom_slider.dart';
import '../connectivity/ble/device_connect_card.dart';
import '../../data/data.dart';
import '../profile_screen/setting_provider.dart';
import 'lock_ev_screen.dart';
import 'widgets/widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

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

              // ✅ Device Connectivity
              if (settings.getSetting("deviceConnectivity")) ...[
                verticalSpacing(10),
                DeviceConnectivityCard(
                  icon: Icons.bluetooth_connected,
                  title: "Device Connection",
                  subtitle: "Tap to scan & connect nearby devices",
                  onTap: () {
                    PaymentService(context: context).doPayment(200);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const ConnectDevicesScreen(),
                    //   ),
                    // );
                  },
                ),
              ],

              // ✅ View Our Plan
              if (settings.getSetting("viewPlans")) ...[
                verticalSpacing(5),
                DeviceConnectivityCard(
                  icon: Icons.auto_graph,
                  title: "View Our Plan",
                  subtitle: "Explore flexible and affordable scooter plans",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PlanScreen()),
                    );
                  },
                ),
              ],

              // ✅ Start / Stop EV
              if (settings.getSetting("startStopEv")) ...[
                verticalSpacing(5),
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
              ],
              // ✅ Speed Lock
              if (settings.getSetting("speedLock"))
                buildSpeedLockSection(context),

              // ✅ Lock EV App
              if (settings.getSetting("lockEvApp"))
                buildLockEvFeatureSection(context),

              // ✅ Battery Tracking
              if (settings.getSetting("batteryTracking"))
                BatteryInfoCard(batteryPercentage: 0.2, rangeKm: 180),

              verticalSpacing(15),

              buildFeatureIcons(context),
              if (!settings.getSetting("chargingStation")) verticalSpacing(20),
              verticalSpacing(5),

              // ✅ Charging Station
              if (settings.getSetting("chargingStation"))
                buildChargingStationSection(context),

              // ✅ Advanced Settings
              buildAdvancedSection(context),

              verticalSpacing(10),
              if (settings.getSetting("newRelease"))
                buildNewReleasesSection(context),
              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }
}
