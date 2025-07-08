import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';
import '../core/constants/text_style.dart';

class CustomeSwitchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color glowColor;
  final bool switchValue; // 👈 new toggle value
  final ValueChanged<bool> onToggle; // 👈 new toggle callback

  const CustomeSwitchButton({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    this.subtitle,
    this.glowColor = AppColors.primaryColor,
    required this.switchValue,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
            // Glow Icon Circle
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    glowColor.withOpacity(0.4),
                    glowColor.withOpacity(0.05),
                  ],
                ),
              ),
              child: Icon(icon, size: 32, color: glowColor),
            ),
            const SizedBox(width: 18),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: blackText18600),
                  const SizedBox(height: 4),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.3,
                      ),
                    ),
                ],
              ),
            ),

            // Toggle Button (Switch)
            Switch(
              value: switchValue,
              onChanged: onToggle,
              activeColor: glowColor,
            ),
          ],
        ),
      ),
    );
  }
}


