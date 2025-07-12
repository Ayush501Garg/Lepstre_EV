import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../../controllers/voice_command_controller.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/utils/shared_preference_service.dart';
import '../../widgets/custom_slider.dart';
import '../connectivity/ble/connect_devices_screen.dart';
import '../connectivity/ble/device_connect_card.dart';
import '../../data/data.dart';
import '../map_screen/single_map_screen.dart';
import '../plans/plan_screen.dart';
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
  late VoiceCommandController _voiceController;
  bool _isListening = false; // 👈 Flag to track mic animation
  dynamic batteryPercentage = 0.2;

  @override
  void initState() {
    super.initState();
    _loadVerificationStatus();
    _voiceController = VoiceCommandController();
    _voiceController.initialize();
  }

  void _loadVerificationStatus() async {
    final verified = await SharedPrefManager.getFingerprintStatus();
    setState(() {
      isUserVerified = verified;
    });
  }

  void _handleVoiceCommand(String command) {
    print("command $command");
    setState(() => _isListening = false);
    if (command.contains("connect device")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ConnectDevicesScreen()),
      );
    } else if (command.contains("open plan") || command.contains("plan")) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => PlanScreen()));
    } else if (command.contains("on off control") ||
        command.contains("on off ev") ||
        command.contains("ev control") ||
        command.contains("control")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LockEvDetailScreen()),
      );
    } else if (command.contains("speed")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Speed lock feature")));
    } else if (command.contains("open lock control") ||
        command.contains("ev lock") ||
        command.contains("ev lock")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LockEvDetailScreen()),
      );
    } else if (command.contains("battery")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Battery info shown")));
    } else if (command.contains("show all charging station") ||
        command.contains("station") ||
        command.contains(" charging station")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SingleMapScreen()),
      );
    } else if (command.contains("new release")) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("New Releases")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Unknown command: $command")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: AvatarGlow(
        glowColor: AppColors.primaryColor,
        animate: _isListening,
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          shape: CircleBorder(),
          onPressed: () {
            _voiceController.listen(
              context,
              _handleVoiceCommand,
              onListeningChanged: (isListening) {
                setState(() => _isListening = isListening);
              },
            );
          },
          child: Icon(
            _isListening ? Icons.mic : Icons.mic_off,
            color: AppColors.whiteColor,
            size: 28,
          ),
        ),
      ),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ConnectDevicesScreen(),
                      ),
                    );
                  },
                ),
              ],
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
              if (settings.isCardVisible("speedLock", isUserVerified))
                buildSpeedLockSection(context),
              if (settings.isCardVisible("lockEvApp", isUserVerified))
                buildLockEvFeatureSection(context),
              if (settings.isCardVisible("batteryTracking", isUserVerified))
                BatteryInfoCard(
                  batteryPercentage: batteryPercentage,
                  rangeKm: 180,
                ),
              verticalSpacing(15),
              buildFeatureIcons(context),
              if (settings.isCardVisible("chargingStation", isUserVerified))
                verticalSpacing(20),
              verticalSpacing(5),
              if (settings.isCardVisible("chargingStation", isUserVerified))
                buildChargingStationSection(context),
              buildAdvancedSection(context),
              verticalSpacing(10),
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
