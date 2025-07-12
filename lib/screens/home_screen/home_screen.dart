import 'package:flutter/material.dart';
import 'package:lepster/screens/plans/plan_screen.dart';
import '../../a.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/utils/shared_preference_service.dart';
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
  bool isUserVerified = false;

  @override
  void initState() {
    super.initState();
    _loadVerificationStatus();
  }

  void _loadVerificationStatus() async {
    final verified = await SharedPrefManager.getFingerprintStatus();
    setState(() {
      isUserVerified = verified;
    });
  }

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

              if (settings.isCardVisible(
                "deviceConnectivity",
                isUserVerified,
              )) ...[
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

              // if (settings.getSetting("deviceConnectivity")) ...[
              //   verticalSpacing(10),
              //   DeviceConnectivityCard(
              //     icon: Icons.bluetooth_connected,
              //     title: "Device Connection",
              //     subtitle: "Tap to scan & connect nearby devices",
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (_) => const ConnectDevicesScreen(),
              //         ),
              //       );
              //     },
              //   ),
              // ],

              // ✅ View Our Plan

              // viewPlans
              if (settings.isCardVisible("viewPlans", isUserVerified)) ...[
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

              // ✅ Start / Stop EV  startStopEv
              if (settings.isCardVisible("startStopEv", isUserVerified)) ...[
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
              // ✅ Speed Lock speedLock
              if (settings.isCardVisible("speedLock", isUserVerified))
                buildSpeedLockSection(context),

              // ✅ Lock EV App   lockEvApp
              if (settings.isCardVisible("lockEvApp", isUserVerified))
                buildLockEvFeatureSection(context),

              if (settings.isCardVisible("showroomsEv", isUserVerified))
                buildEvShowroomsSection(context),

              // ✅ Battery Tracking   batteryTracking
              if (settings.isCardVisible("batteryTracking", isUserVerified))
                BatteryInfoCard(batteryPercentage: 0.2, rangeKm: 180),

              verticalSpacing(15),

              // ✅ Charging Station   chargingStation
              if (settings.isCardVisible("chargingStation", isUserVerified))
                buildChargingStationSection(context),

              // ✅ Advanced Settings
              buildAdvancedSection(context),

              verticalSpacing(10), // newRelease
              if (settings.isCardVisible("newRelease", isUserVerified))
                buildNewReleasesSection(context),
              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }
}
