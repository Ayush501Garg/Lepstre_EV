import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';
import '../core/constants/app_sizing.dart';
import '../core/constants/text_style.dart';

class PlanCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String price;
  final String subtitle;
  final Color color;

  const PlanCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.price,
    required this.subtitle,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenHeight(context) * 0.2,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.greyColor, width: 0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            // Icon(icon, size: 30, color: color),
            // const SizedBox(height: 12),

            // Plan Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: blackText16600,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            verticalSpacing(15),

            // Price
            Text(price, textAlign: TextAlign.center, style: primaryText20600),

            verticalSpacing(15),

            // Subtitle
            Text(subtitle, textAlign: TextAlign.center, style: greyText12400),
          ],
        ),
      ),
    );
  }
}





class CustomPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final IconData icon;
  final BoxShadow boxShadow;

  const CustomPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.icon,
    required this.boxShadow,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [boxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon at the top
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 50,
              color: Colors.blueAccent,
            ),
          ),

          const SizedBox(height: 20),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 8),

          // Price
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 12),

          // Subtitle (Detailed)
          Expanded(
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}


