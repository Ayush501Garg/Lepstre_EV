import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/core/constants/app_sizing.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  _sectionTitle("Scanned Devices"),
                  _historyCard(
                    title: "Device Connected",
                    subtitle: "Device ID: 1234567890",
                    timestamp: "Today, 10:30 AM",
                    icon: Icons.qr_code_2,
                  ),
                  _historyCard(
                    title: "Device Connected",
                    subtitle: "Device ID: ABC12345XYZ",
                    timestamp: "Yesterday, 5:42 PM",
                    icon: Icons.qr_code_2,
                  ),

                  verticalSpacing(10),
                  _sectionTitle("Bike Purchases"),
                  _historyCard(
                    title: "Lepster LX2 Purchased",
                    subtitle: "Order ID: LEP67892",
                    timestamp: "15 June 2025",
                    icon: Icons.electric_bike,
                  ),

                  _historyCard(
                    title: "Lepster Mini EV Purchased",
                    subtitle: "Order ID: LEP45901",
                    timestamp: "12 April 2025",
                    icon: Icons.electric_scooter,
                  ),

                  verticalSpacing(20),
                  _sectionTitle("Other Activities"),
                  _historyCard(
                    title: "Profile Updated",
                    subtitle: "Email and phone updated",
                    timestamp: "10 June 2025",
                    icon: Icons.person_outline,
                  ),

                  _historyCard(
                    title: "Logged In",
                    subtitle: "Device: OnePlus Nord",
                    timestamp: "9 June 2025",
                    icon: Icons.login,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
      child: Text(
        title,
        style: blackText16600.copyWith(color: AppColors.blackColor),
      ),
    );
  }

  Widget _historyCard({
    required String title,
    required String subtitle,
    required String timestamp,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryColor, size: 26),
        ),
        title: Text(title, style: blackText12600),
        subtitle: Text(subtitle, style: greyText12400),
        trailing: Text(timestamp, style: primaryText12600),
      ),
    );
  }
}
