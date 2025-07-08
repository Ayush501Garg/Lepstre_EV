import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';

import '../../widgets/custom_dialod.dart';

class LockEvDetailScreen extends StatelessWidget {
  const LockEvDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Youpao2 Blue", style: blackText16600),
                        verticalSpacing(2),
                        Row(
                          children: [
                            const Icon(
                              Icons.bluetooth,
                              color: Colors.teal,
                              size: 15,
                            ),
                            horizontalSpacing(1),
                            const Icon(
                              Icons.wifi,
                              color: Colors.teal,
                              size: 15,
                            ),
                            horizontalSpacing(2),

                            Text("Connected, Active", style: greenText12600),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 21,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=4',
                      ),
                    ),
                  ],
                ),
              ),

              verticalSpacing(20),
              _buildStatusSection(context),
              verticalSpacing(10),
              Container(
                width: screenWidth(context) * 0.7,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    Text(" Your EV is ready to go", style: blackText14600),
                  ],
                ),
              ),
              verticalSpacing(20),
              EvControlBar(),
              verticalSpacing(20),
              _buildLocationCard(),
              verticalSpacing(10),
              _buildLocationCard1(),
              verticalSpacing(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenW = constraints.maxWidth;
        double screenH = MediaQuery.of(context).size.height;
        double imageHeight = screenH * 0.25; // Adjust based on available height
        double containerHeight = screenH * 0.42;

        return SizedBox(
          height: containerHeight,
          child: Stack(
            children: [
              /// Radial background gradient circles
              Positioned(
                right: -screenW * 0.15,
                top: screenH * 0.02,
                child: Container(
                  height: screenH * 0.28,
                  width: screenW * 0.7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFB2FEFA).withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -screenW * 0.15,
                top: screenH * 0.10,
                child: Container(
                  height: screenH * 0.24,
                  width: screenW * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightGreenColor.withOpacity(0.12),
                        blurRadius: 10,
                        spreadRadius: 40,
                      ),
                    ],
                  ),
                ),
              ),

              /// Foreground bike image and battery info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    /// Left Battery Info
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("124", style: blackText60600),
                          const SizedBox(height: 4),
                          Text("Km Range", style: greyText14600),
                          const SizedBox(height: 18),
                          _buildBatteryCard(context),
                        ],
                      ),
                    ),

                    /// Right Image
                    SizedBox(
                      height: imageHeight,
                      child: Image.asset(youpao_2_blue, fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildBatteryCard(BuildContext context) {
  final screenW = MediaQuery.of(context).size.width;

  double size = screenW * 0.23; // Responsive size for CustomPaint
  double fontSize = screenW * 0.075;
  double percentFont = screenW * 0.04;
  double paddingTop = size * 0.25;
  double paddingLeft = size * 0.45;

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    padding: EdgeInsets.only(
      right: screenW * 0.06,
      top: screenW * 0.02,
      bottom: screenW * 0.05,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: DShapePainter(progress: 0.76),
        ),
        Padding(
          padding: EdgeInsets.only(top: paddingTop, left: paddingLeft),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '76',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenW * 0.01), // spacing between 76 and row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '%',
                    style: TextStyle(
                      fontSize: percentFont,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: screenW * 0.015),
                  Icon(
                    Icons.battery_4_bar,
                    size: percentFont + 4,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildLocationCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.whiteColor,
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Location", style: primaryText14600),
              const SizedBox(height: 4),
              Text("Marynarska 21,\nWarsaw, Poland", style: blackText14600),
              const SizedBox(height: 6),
              Text("24m • Now", style: greyText12600),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              map,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildLocationCard1() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.whiteColor,
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            map,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpacing(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Current Location", style: primaryText14600),
            const SizedBox(height: 4),
            Text("Marynarska 21 ,Warsaw, Poland", style: blackText14600),
            const SizedBox(height: 6),
            Text("24m • Now", style: greyText12600),

            const SizedBox(height: 4),
            Text("Speed • 80 Km/h ", style: greyText12600),
          ],
        ),
      ],
    ),
  );
}

class EvControlBar extends StatefulWidget {
  const EvControlBar({super.key});

  @override
  State<EvControlBar> createState() => _EvControlBarState();
}

class _EvControlBarState extends State<EvControlBar> {
  bool isOn = false;
  bool isLocked = true;
  bool isPowerSaving = false;

  void togglePower() {
    setState(() {
      isOn = !isOn;
    });
  }

  void _showLockDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomInfoDialog(
        title: isLocked ? "Unlock EV" : "Lock EV",
        message: isLocked
            ? "Are you sure you want to unlock your EV?"
            : "Do you want to lock your EV?",
        onTap: () {
          Navigator.pop(context);
          setState(() => isLocked = !isLocked);
        },
      ),
    );
  }

  void _showPowerSavingDialog() {
    showDialog(
      context: context,
      builder: (context) => CustomInfoDialog(
        title: isPowerSaving ? "Disable Power Saving" : "Enable Power Saving",
        message: isPowerSaving
            ? "Do you want to disable power saving mode?"
            : "Enable power saving to optimize your EV performance.",
        onTap: () {
          Navigator.pop(context);
          setState(() => isPowerSaving = !isPowerSaving);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background capsule bar
          Container(
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 🔐 Lock icon
                  GestureDetector(
                    onTap: _showLockDialog,
                    child: Icon(
                      isLocked ? Icons.lock : Icons.lock_open,
                      color: isLocked ? Colors.redAccent : Colors.green,
                      size: 28,
                    ),
                  ),

                  /// ⚡ Power-saving icon
                  GestureDetector(
                    onTap: _showPowerSavingDialog,
                    child: Icon(
                      Icons.battery_saver,
                      size: 28,
                      color: isPowerSaving ? Colors.redAccent : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Power button (center)
          GestureDetector(
            onTap: togglePower,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: CustomPaint(
                painter: NeonRingPainter(isOn: isOn),
                child: Center(
                  child: Icon(
                    Icons.power_settings_new,
                    size: 28,
                    color: isOn
                        ? const Color.fromARGB(255, 114, 10, 2)
                        : const Color.fromARGB(255, 30, 169, 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NeonRingPainter extends CustomPainter {
  final bool isOn;
  NeonRingPainter({required this.isOn});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double radius = size.width / 2 - 8;

    // Glow behind ring
    final Paint glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.tealAccent.shade100.withOpacity(0.3),
          Colors.tealAccent.withOpacity(0.1),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Foreground ring
    final Paint ringPaint = Paint()
      ..color = isOn
          ? const Color.fromARGB(255, 114, 10, 2)
          : const Color.fromARGB(255, 30, 169, 2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(center, radius + 4, glowPaint);
    canvas.drawCircle(center, radius, ringPaint);
  }

  @override
  bool shouldRepaint(covariant NeonRingPainter oldDelegate) =>
      oldDelegate.isOn != isOn;
}

class DBatteryProgress extends StatelessWidget {
  final double percentage;

  const DBatteryProgress({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(90, 90),
            painter: DShapePainter(progress: percentage),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${(percentage * 100).toInt()}', style: blackText36600),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('%', style: greyText14600),
                    SizedBox(width: 6),
                    Icon(Icons.battery_4_bar, size: 20, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DShapePainter extends CustomPainter {
  final double progress;

  DShapePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.0;
    final radius = 30.0;

    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..shader = LinearGradient(
        colors: [AppColors.primaryLightColor, AppColors.primaryColor],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final verticalLength = size.height - radius - 10;
    final horizontalLength = size.width - radius - 10;

    final totalLength = verticalLength + (pi * radius / 2) + horizontalLength;
    final progressLength = totalLength * progress;

    final path = Path();
    final fgPath = Path();

    // Background D path
    path.moveTo(10, size.height);
    path.lineTo(10, radius + 10);
    path.arcTo(
      Rect.fromCircle(center: Offset(radius + 10, radius + 10), radius: radius),
      pi,
      pi / 2,
      false,
    );
    path.lineTo(size.width, 10);

    // Foreground progress path
    double drawn = 0;

    // 1. Vertical part
    fgPath.moveTo(10, size.height);
    final vLine = min(progressLength, verticalLength);
    if (vLine > 0) {
      fgPath.lineTo(10, size.height - vLine);
      drawn += vLine;
    }

    // 2. Arc part
    if (progressLength > drawn) {
      final arcProgress = min((progressLength - drawn), (pi * radius / 2));
      final sweep = arcProgress / (pi * radius / 2) * (pi / 2);
      fgPath.addArc(
        Rect.fromCircle(
          center: Offset(radius + 10, radius + 10),
          radius: radius,
        ),
        pi,
        sweep,
      );
      drawn += arcProgress;
    }

    // 3. Horizontal part
    if (progressLength > drawn) {
      final hLine = min(progressLength - drawn, horizontalLength);
      fgPath.moveTo(radius + 10, 10);
      fgPath.lineTo(radius + 10 + hLine, 10);
    }

    // Draw paths
    canvas.drawPath(path, bgPaint);
    canvas.drawPath(fgPath, fgPaint);
  }

  @override
  bool shouldRepaint(covariant DShapePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
