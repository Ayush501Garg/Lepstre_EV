import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/constants/image_path.dart';
import '../../widgets/custom_image_icon.dart';
import '../../widgets/scooter_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=5',
                    ),
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
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryLightColor,
                          blurRadius: 2,
                        ),
                      ],
                      color: AppColors.backgroundColor,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacing(20),
            // Balance Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryLightColor,
                      blurRadius: 2,
                    ),
                  ],
                  color: AppColors.whiteColor,
                ),

                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '\$1500',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D7BFF),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Topup +',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacing(30),
            ScooterCarousel(),
            verticalSpacing(30),

            // Bike Image & Info
            Expanded(
              child: Column(
                children: [
                  verticalSpacing(10),
                  // Battery & Range Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: AppColors.primaryLightColor,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageIcon(image: sendIcon),
                                    horizontalSpacing(10),
                                    Text(
                                      "84.2 Km",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacing(2),
                                Text(
                                  "est. range for 56%",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: AppColors.primaryLightColor,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageIcon(image: batteryIcon),
                                    horizontalSpacing(10),
                                    Text(
                                      "56%",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacing(5),
                                Text(
                                  "Charging until 2h 12min",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        _ControlButton(
                          icon: tripIcon,
                          label: "Trip",
                          color: AppColors.whiteColor,
                          iconColor: Colors.black,
                        ),
                        horizontalSpacing(10),
                        _ControlButton(
                          icon: powerIcon,
                          isShadowRequired: false,
                          label: "Turn On",
                          color: AppColors.primaryColor,
                          iconColor: Colors.white,
                          textColor: Colors.white,
                        ),
                        horizontalSpacing(10),
                        _ControlButton(
                          icon: sosIcon,
                          label: 'SOS',

                          color: AppColors.whiteColor,
                          iconColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Nav Bar
      bottomNavigationBar: Container(
        margin: symmetricPadding(
          context: context,
          horizontalPercent: 10,
          verticalPercent: 15,
        ),
        padding: symmetricPadding(
          context: context,
          horizontalPercent: 10,
          verticalPercent: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: AppColors.primaryLightColor, blurRadius: 2),
          ],
          color: AppColors.backgroundColor,
        ),

        child: BottomNavigationBar(
          backgroundColor: AppColors.backgroundColor,
          currentIndex: 0,
          elevation: 0,

          selectedItemColor: AppColors.primaryLightColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Locate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final dynamic icon;
  final String label;
  final Color color;
  final Color iconColor;
  final Color? textColor;
  final dynamic isShadowRequired;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.iconColor,
    this.textColor,

    this.isShadowRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: getScreenHeight(context) * 0.12,
        decoration: BoxDecoration(
          color: color,
          boxShadow: !isShadowRequired
              ? null
              : [BoxShadow(blurRadius: 2, color: AppColors.primaryLightColor)],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageIcon(image: icon, size: 25),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
