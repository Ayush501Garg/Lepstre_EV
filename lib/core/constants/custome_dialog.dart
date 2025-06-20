import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonTap;
  final VoidCallback onCancelTap;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonTap,
    required this.onCancelTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle with icon
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),
            // Main Button
            ElevatedButton(
              onPressed: onButtonTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            // Cancel Button
            OutlinedButton(
              onPressed: onCancelTap,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primaryColor.withOpacity(0.2)),
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: AppColors.primaryColor.withOpacity(0.05),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}