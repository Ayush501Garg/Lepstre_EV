import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_btn.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SpeedLockDetailScreen extends StatefulWidget {
  const SpeedLockDetailScreen({super.key});

  @override
  State<SpeedLockDetailScreen> createState() => _SpeedLockDetailScreenState();
}

class _SpeedLockDetailScreenState extends State<SpeedLockDetailScreen> {
  double currentSpeed = 45;
  final double minSpeed = 20;
  final double maxSpeed = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(10),
              _buildHeader(),
              const SizedBox(height: 20),
              _glassCard(
                child: Column(
                  children: [
                    Text(
                      "🔒 Lock Your EV Speed",
                      textAlign: TextAlign.center,
                      style: blackText30600,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Control how fast your EV can go. Avoid misuse or save power by limiting speed.",
                      textAlign: TextAlign.center,
                      style: greyText13600,
                    ),
                    const SizedBox(height: 25),
                    _buildSpeedRadialSlider(),
                    const SizedBox(height: 15),
                    _buildSpeedLimits(),
                  ],
                ),
              ),
              verticalSpacing(50),
              CustomButton(
                title: "Lock Speed",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        customBackButton(
          context: context,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        horizontalSpacing(15),
        Text("Speed Lock", style: blackText18600),
      ],
    );
  }

  Widget _glassCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      ),
    );
  }

  Widget _buildSpeedRadialSlider() {
    return SleekCircularSlider(
      min: minSpeed,
      max: maxSpeed,
      initialValue: currentSpeed,
      appearance: CircularSliderAppearance(
        customWidths: CustomSliderWidths(
          trackWidth: 10,
          progressBarWidth: 18,
          handlerSize: 8,
        ),
        customColors: CustomSliderColors(
          trackColor: Colors.grey.shade300,
          progressBarColors: [
            AppColors.primaryColor,
            AppColors.primaryLightColor,
          ],
          dotColor: Colors.white,
        ),
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          modifier: (double value) {
            return '${value.toInt()} km/h';
          },
        ),
        startAngle: 140,
        angleRange: 260,
        size: 230,
      ),
      onChange: (value) {
        setState(() {
          currentSpeed = value;
        });
      },
    );
  }

  Widget _buildSpeedLimits() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _limitBox("Min", "$minSpeed km/h"),
        _limitBox("Max", "$maxSpeed km/h"),
      ],
    );
  }

  Widget _limitBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(label, style: greyText12600),
          const SizedBox(height: 4),
          Text(value, style: blackText14600),
        ],
      ),
    );
  }
}
