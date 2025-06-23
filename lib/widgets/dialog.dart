import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lottie/lottie.dart';

Future<void> showCheckoutSuccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.85),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    successAnimation,
                    height: 140,
                    repeat: false,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Payment Successful!",
                    style: blackText18600,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your order has been placed successfully.\nWe’ll notify you when it’s on the way.",
                    style: greyText14600,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      Navigator.popUntil(
                        context,
                        (route) => route.isFirst,
                      ); // Back to Home
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGreenColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 8,
                      shadowColor: AppColors.darkGreenColor.withOpacity(0.5),
                    ),
                    child: Text("Back to Home", style: whiteText14600),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
