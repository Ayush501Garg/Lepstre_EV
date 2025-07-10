import 'package:flutter/material.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_btn.dart';

import 'package:lepster/core/constants/app_color.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const referralMessage =
        "🚀 Join the electric revolution with our EV app!\n"
        "🔋 Track battery, charging, speed & more.\n"
        "🎁 Use my referral link: https://play.google.com/store/apps/details?id=com.yourcompany.yourapp\n"
        "Earn rewards when your friends join!";

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BackBtnWithText(context: context, text: "Refer & Earn"),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/refer.jpg', // Add this image in your assets
              ),
              const SizedBox(height: 20),
              const Text(
                "Invite your friends & earn rewards!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Share the app with your friends and earn exciting rewards when they join using your link.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: AppColors.greyColor),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Your Referral Message",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      referralMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // CustomButton(
                    //   title: "Share Now",
                    //   onPressed: () {
                    //     Share.share(referralMessage);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
