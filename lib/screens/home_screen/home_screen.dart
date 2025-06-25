import 'package:flutter/material.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/notification_screen/notification_screen.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_page_route.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/constants/image_path.dart';
import '../../core/routes/routes.dart';
import '../bikes_screen/bikes_screen.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
              verticalSpacing(20),
              _buildFullWidthBuyEVSection(),
              verticalSpacing(20),
              _buildFeatureIcons(context),
              verticalSpacing(10),
              _buildChargingStationSection(context),

              _buildAdvancedSection(context),
              verticalSpacing(20),
              _buildLockEvFeatureSection(context),
              verticalSpacing(20),
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
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
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
              Text(feature['label'] as String, style: blackText12600),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAdvancedSection(context) {
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
            subtitle: "Last charged 1w ago",
            context: context,
          ),
          _advancedTile(
            Icons.map,
            "Nearest Station",
            "2.5 km",
            subtitle: "10 mins away",
            context: context,
          ),
          _advancedTile(
            Icons.device_thermostat,
            "Climate",
            "20° C",
            context: context,
            subtitle: "Interior 24°",
          ),
          _advancedTile(
            Icons.speed,
            "Tyre Pressure",
            "32 PSI",
            subtitle: "Tyre 3 Optimal",
            context: context,
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
  }) {
    return Container(
      width: screenWidth(context) * 0.44,
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
                    Text(
                      "BUY EV",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Top brands under one roof", style: whiteText14600),
                    SizedBox(height: 10),
                    Text(
                      "Explore a wide range of electric vehicles, view specifications, price & offers.",
                      style: whiteText12600,
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
                    return Container(
                      width: 220,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.primaryLightColor),
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
                                Text("Sector 62, Noida", style: greyText12600),
                                const SizedBox(height: 4),
                                Text(
                                  "Available: 4 slots",
                                  style: greenText12600,
                                ),
                              ],
                            ),
                          ),
                        ],
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
        sectionHeader(context, title: "New Releasees"),
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
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildLockEvFeatureSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LockEvDetailScreen()),
        );
      },
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
        child: Row(
          children: [
            Icon(Icons.lock, size: 32, color: AppColors.primaryColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lock EV via App", style: primaryText16600),
                  const SizedBox(height: 4),
                  Text(
                    "Secure your EV instantly using BLE. Lock/unlock anytime via your phone.",
                    style: greyText12400,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
    ),
  );
}
