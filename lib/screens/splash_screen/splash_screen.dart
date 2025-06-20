import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  final List<int> screenDurations = [
    100, // index 0
    100, // index 1
    1500, // index 2
    750, // index 3
    750, // index 4
    500, // index 5
  ];

  final List<Widget> logos = [
    const SizedBox(key: ValueKey(0)),
    const SizedBox(key: ValueKey(1)),
    Stack(
      key: const ValueKey(2),
      alignment: Alignment.center,
      children: [
        Image.asset(
          splaceVector,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Image.asset(appLogo),
      ],
    ),
    const CircleAvatar(
      key: ValueKey(3),
      radius: 5,
      backgroundColor: Colors.greenAccent,
    ),
    Row(
      key: const ValueKey(4),
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'LEPSTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
        CircleAvatar(radius: 4, backgroundColor: Colors.greenAccent),
      ],
    ),
    const SizedBox(key: ValueKey(5)),
  ];

  final List<Gradient> gradients = [
    const LinearGradient(colors: [Colors.black, Colors.black]),
    const LinearGradient(colors: [Colors.black, Colors.black]),
    const LinearGradient(colors: [Colors.black, Colors.black]),
    const LinearGradient(colors: [Colors.black, Colors.black]),
    const LinearGradient(colors: [Colors.black, Colors.black]),
    const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColors.darkGreenColor,
        AppColors.greenColor,
        AppColors.lightGreenColor,
      ],
      stops: [0.0, 0.5, 1.0],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimedSplashSequence();
  }

  void _startTimedSplashSequence() {
    int accumulatedTime = 0;

    for (int i = 0; i < screenDurations.length; i++) {
      accumulatedTime += screenDurations[i];

      Future.delayed(Duration(milliseconds: accumulatedTime), () {
        if (!mounted) return;

        setState(() {
          _currentIndex = i;
        });

        if (i == screenDurations.length - 1) {
          Future.delayed(Duration(milliseconds: screenDurations[i]), () {
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => OnboardingScreen()),
              );
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(gradient: gradients[_currentIndex]),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: logos[_currentIndex],
          ),
        ),
      ),
    );
  }
}
