import 'package:flutter/material.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/notification_screen/notification_screen.dart';
import 'package:lepster/screens/plan_screen/plan_screen.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_page_route.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_setting.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/constants/image_path.dart';
import '../../provider/ToggleProvider.dart';
import '../../widgets/custom_dialod.dart';
import '../../widgets/custom_slider.dart';
import '../../widgets/custom_switch.dart';
import '../bikes_screen/biike_details_screen.dart';
import '../bikes_screen/bikes_screen.dart';
import '../connectivity/connect_devices_screen.dart';
import '../connectivity/device_connect_card.dart';
import '../data/data.dart';
import 'lock_ev_screen.dart';
import 'map_screen/station_screen.dart';
import 'speed_lock_screen.dart';


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
              _buildHeader(context),
              verticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomImageSlider(imagePaths: sliderImages),
              ),
              // _buildFullWidthBuyEVSection(),



              // ValueListenableBuilder(
              //   valueListenable: AppSettings.plan_card,
              //   builder: (context, value, _) {
              //     return value
              //         ?  DeviceConnectivityCard(
              //       icon: Icons.auto_graph,
              //       title: "View Our Plan",
              //       subtitle: "Explore flexible and affordable scooter plans",
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (_) => PlanScreen()),
              //         );
              //       },
              //     )
              //         : const SizedBox.shrink(); // ✅ No space, no widget, nothing rendered
              //   },
              // ),


              Consumer<ToggleProvider>(
                builder: (context, toggle, child) {
                  return toggle.getToggle("device_connection")
                      ?  DeviceConnectivityCard(
                    icon: Icons.auto_graph,
                    title: "Device Connection",
                    subtitle: "Connect your scooter to your phone",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LockEvDetailScreen()),
                      );
                    },
                  )
                      : SizedBox.shrink();
                },
              ),

              verticalSpacing(10),

              Consumer<ToggleProvider>(
                builder: (context, toggle, child) {
                  return toggle.getToggle("plan_card")
                      ?  DeviceConnectivityCard(
                    icon: Icons.auto_graph,
                    title: "View Our Plan",
                    subtitle: "Explore flexible and affordable scooter plans",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PlanScreen()),
                      );
                    },
                  )
                      : SizedBox.shrink();
                },
              ),


              verticalSpacing(10),
              _buildChargingStationSection(context),
              _buildAdvancedSection(context),
              verticalSpacing(10),
              buildNewReleasesSection(context),
              verticalSpacing(30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=4'),
            radius: 25,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: TextStyle(fontSize: 14)),
                Text(
                  'Ayush Garg',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          customBackButton(
            padding: 12,
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(child: NotificationScreen()),
              );
            },
            isShadow: false,
            icon: Icons.notifications_none,
            bgColor: AppColors.primaryColor,
            iconColor: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcons(BuildContext context) {
    final features = [
      {'icon': Icons.pedal_bike, 'label': 'EV Test Ride'},
      {'icon': Icons.share, 'label': 'Refer & Earn'},
      {'icon': Icons.bolt, 'label': 'Charging Plans'},
      {'icon': Icons.phone, 'label': 'Contact'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: features.map((feature) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Icon(
                  feature['icon'] as IconData,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                feature['label'] as String,
                textAlign: TextAlign.center,
                style: blackText12600,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAdvancedSection(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double tileWidth =
        (screenWidth - 45) / 2; // 15 (left) + 15 (spacing) + 15 (right)

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          _advancedTile(
            Icons.battery_charging_full,
            "Battery",
            "80%",
            subtitle: "Last charged",
            context: context,
            width: tileWidth,
          ),
          _advancedTile(
            Icons.map,
            "Nearest Station",
            "2.5 km",
            subtitle: "10 mins away",
            context: context,
            width: tileWidth,
          ),
          _advancedTile(
            Icons.device_thermostat,
            "Climate",
            "20° C",
            subtitle: "Interior 24°",
            context: context,
            width: tileWidth,
          ),
          _advancedTile(
            Icons.speed,
            "Tyre Pressure",
            "32 PSI",
            subtitle: "Tyre 3 Optimal",
            context: context,
            width: tileWidth,
          ),
        ],
      ),
    );
  }

  Widget _advancedTile(
    IconData icon,
    String title,
    String value, {
    String? subtitle,
    required context,
    width,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 30, color: AppColors.primaryColor),
          if (subtitle != null) Text(subtitle, style: greyText12400),
          Text(value, style: blackText20600),
          Text(title, style: blackText14600),
        ],
      ),
    );
  }

  Widget _buildFullWidthBuyEVSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black87,
            gradient: appGradient,
            boxShadow: const [
              BoxShadow(color: AppColors.lightCreame, blurRadius: 2),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BUY EV", style: blackText18600),
                    SizedBox(height: 8),
                    Text("Top brands under one roof", style: blackText14600),
                    SizedBox(height: 10),
                    Text(
                      "Explore a wide range of electric vehicles, view specifications, price & offers.",
                      style: blackText12600,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(ev1, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChargingStationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/charging_detail'),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Charging Stations", style: primaryText18600),
              const SizedBox(height: 8),
              Text(
                "Find nearby EV stations with live directions, availability & offers.",
                style: greyText13600,
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(child: StationScreen()),
                        );
                      },
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryLightColor,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                ev1,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "GreenCharge Station",
                                    style: blackText14600,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Sector 62, Noida",
                                    style: greyText12600,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Available: 4 slots",
                                    style: greenText10600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildNewReleasesSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader(context, title: "New Releases"),
        SizedBox(
          height: screenHeight(context) * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vehicleList.length,
            itemBuilder: (context, index) {
              final item = vehicleList[index];



              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 500 + index * 100),
                tween: Tween(begin: 0.8, end: 1),
                curve: Curves.easeOutBack,
                builder: (_, scale, child) =>
                    Transform.scale(scale: scale, child: child),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: BiikeDetailsScreen(
                          image: item['image']!,
                          title: item['name']!,
                          price:
                              item['Range']!, // Or item['price'] if you have that
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth(context) * 0.55,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: appGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            item['image']!,
                            height: screenHeight(context) * 0.3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          bottom: 16,
                          right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: whiteText20600.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              verticalSpacing(4),
                              Text(
                                item['Range']!,
                                style: whiteText14600.copyWith(
                                  color: AppColors.lightCreame,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "New",
                              style: whiteText12600.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildLockEvFeatureSection(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LockEvDetailScreen()),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Glowing Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryColor.withOpacity(0.35),
                  AppColors.primaryColor.withOpacity(0.08),
                ],
              ),
            ),
            child: Icon(Icons.lock, size: 30, color: AppColors.primaryColor),
          ),

          const SizedBox(width: 18),

          // Info text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lock EV via App", style: blackText18600),
                const SizedBox(height: 3),
                const Text(
                  "Secure your EV using BLE connectivity anytime, anywhere from your phone.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

class BatteryInfoCard extends StatefulWidget {
  final double batteryPercentage; // 0.0 - 1.0
  final int rangeKm;

  const BatteryInfoCard({
    super.key,
    required this.batteryPercentage,
    required this.rangeKm,
  });

  @override
  State<BatteryInfoCard> createState() => _BatteryInfoCardState();
}

class _BatteryInfoCardState extends State<BatteryInfoCard> {
  bool isSavingMode = true;
  @override
  Widget build(BuildContext context) {
    final int percent = (widget.batteryPercentage * 100).toInt();
    final bool isLow = percent <= 20;

    Color getBatteryColor() {
      if (percent >= 60) return Colors.greenAccent;
      if (percent >= 30) return Colors.orangeAccent;
      return Colors.redAccent;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: getBatteryColor().withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Big Battery
          _buildBatteryVisual(percent, getBatteryColor()),
          const SizedBox(width: 20),

          // Right Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Battery", style: blackText20600),
                const SizedBox(height: 2),
                const Text("Last charge 1w ago", style: greyText12600),
                const SizedBox(height: 6),
                Text("${widget.rangeKm} km", style: blackText30600),
                const SizedBox(height: 2),
                Text(
                  "$percent%",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: getBatteryColor(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  percent <= 20
                      ? "Status: Low"
                      : (percent <= 50 ? "Status: Moderate" : "Status: Good"),
                  style: TextStyle(
                    color: percent <= 20
                        ? Colors.redAccent
                        : (percent <= 50
                              ? Colors.orangeAccent
                              : Colors.greenAccent),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                horizontalSpacing(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SAVING MODE", style: blackText18600),
                    CustomSwitchButton(
                      value: isSavingMode,
                      onChanged: (value) {
                        setState(() {
                          isSavingMode = value;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => CustomInfoDialog(
                            title: value
                                ? "Saving Mode Activated"
                                : "Saving Mode Disabled",
                            message: value
                                ? "Your EV is now running in battery-saving mode."
                                : "Battery-saving mode has been turned off.",
                            icon: value
                                ? Icons.check_circle
                                : Icons.warning_amber_rounded,
                            iconColor: value ? Colors.green : Colors.orange,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryVisual(int percent, Color fillColor) {
    return Column(
      children: [
        // Battery Cap
        Container(
          width: 28,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 2),

        // Battery Body
        Container(
          width: 70,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: fillColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: fillColor.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Battery Fill
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                height: (percent / 100) * 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      fillColor.withOpacity(0.9),
                      fillColor.withOpacity(0.6),
                      fillColor.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),

              // Bolt Icon
              const Positioned(
                top: 50,
                child: Icon(Icons.bolt, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StartStopEVCard extends StatelessWidget {
  final VoidCallback onTap;

  const StartStopEVCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon with glow circle
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.tealAccent.withOpacity(0.4),
                    Colors.tealAccent.withOpacity(0.05),
                  ],
                ),
              ),
              child: const Icon(
                Icons.power_settings_new,
                size: 32,
                color: Colors.tealAccent,
              ),
            ),
            const SizedBox(width: 18),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start / Stop EV", style: blackText18600),
                  const SizedBox(height: 3),
                  const Text(
                    "Control your EV with a single tap. It’s quick, safe, and energy-efficient.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSpeedLockSection(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SpeedLockDetailScreen()),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Glowing Speed Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.deepPurpleAccent.withOpacity(0.4),
                  Colors.deepPurpleAccent.withOpacity(0.08),
                ],
              ),
            ),
            child: const Icon(
              Icons.speed,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
          ),

          const SizedBox(width: 18),

          // Info Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Speed Lock", style: blackText18600),
                const SizedBox(height: 3),
                const Text(
                  "Restrict EV speed by setting a custom limit. Helps with safety & battery.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
