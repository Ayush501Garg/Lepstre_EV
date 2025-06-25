import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';

class LockEvDetailScreen extends StatelessWidget {
  const LockEvDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: customBackButton(onTap: () => Navigator.pop(context)),
        title: Text("Lock EV Feature", style: primaryText18600),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(onboarding3, height: 200),
              verticalSpacing(20),
              Text(
                "Control & Secure Your EV Remotely",
                style: blackText20600.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpacing(10),
              Text(
                "Using BLE (Bluetooth Low Energy), you can instantly lock or unlock your electric vehicle using your smartphone. This ensures real-time connectivity between your EV and the app, offering you safety, control, and convenience wherever you are.",
                style: greyText14600,
              ),
              verticalSpacing(20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Highlights", style: primaryText16600),
                    verticalSpacing(8),
                    _featurePoint("🔒 Instant Lock/Unlock using BLE"),
                    _featurePoint("📲 Connect mobile with EV securely"),
                    _featurePoint("🛡️ Secure sessions and commands"),
                    _featurePoint("⚙️ Low battery BLE alerts"),
                    _featurePoint("📡 Real-time command status feedback"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featurePoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text("• $text", style: blackText14600),
    );
  }
}
