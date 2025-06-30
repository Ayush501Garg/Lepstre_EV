import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/screens/starting_screen/onboarding_screen.dart';

import '../../core/constants/text_style.dart';
import '../../widgets/custom_page_route.dart';

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
    500, // index 4
    500, // index 5
    750, // index 5
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
    const AnimatedLepsterReveal(key: ValueKey(3)), // <== Use this here

    Row(
      key: const ValueKey(4),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('LEPSTER', style: whiteText30Bold),
        SizedBox(width: 4),
        CircleAvatar(radius: 4, backgroundColor: Colors.greenAccent),
      ],
    ),
    const GradientCircleReveal(key: ValueKey(5)),
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

        // if (i == screenDurations.length - 1) {
        //   Future.delayed(Duration(milliseconds: screenDurations[i]), () {
        //     if (mounted) {
        //       Navigator.pushReplacement(
        //         context,
        //         CustomPageRoute(
        //           child: OnboardingScreen(),
        //           transitionType: TransitionType.fade,
        //         ),
        //       );
        //     }
        //   });
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.black, Colors.black]),
        ),

        // decoration: BoxDecoration(gradient: gradients[_currentIndex]),
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

class AnimatedLepsterReveal extends StatefulWidget {
  const AnimatedLepsterReveal({super.key});

  @override
  State<AnimatedLepsterReveal> createState() => _AnimatedLepsterRevealState();
}

class _AnimatedLepsterRevealState extends State<AnimatedLepsterReveal> {
  Alignment _circleAlignment = Alignment.center;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Hold circle at center, then animate a bit to the right
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() {
        _circleAlignment = const Alignment(0.25, 0.0); // Slightly right
      });

      // Then reveal the text after slower movement finishes
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            _showText = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Moving Circle
        AnimatedAlign(
          duration: const Duration(milliseconds: 500), // slower movement
          alignment: _circleAlignment,
          curve: Curves.easeInOut,
          child: const CircleAvatar(
            radius: 5,
            backgroundColor: Colors.greenAccent,
          ),
        ),

        // Text + Circle fades in
        // AnimatedOpacity(
        //   opacity: _showText ? 1.0 : 0.0,
        //   duration: const Duration(milliseconds: 400),
        //   curve: Curves.easeIn,
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: const [
        //       Text(
        //         'LEPSTER',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 40,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(width: 4),
        //       CircleAvatar(radius: 4, backgroundColor: Colors.greenAccent),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class GradientCircleReveal extends StatefulWidget {
  const GradientCircleReveal({super.key});

  @override
  State<GradientCircleReveal> createState() => _GradientCircleRevealState();
}

class _GradientCircleRevealState extends State<GradientCircleReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          CustomPageRoute(child: OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Calculate max radius needed to fully cover screen
    final maxRadius = sqrt(pow(size.width, 2) + pow(size.height, 2));

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: _CircleClipper(radius: _controller.value * maxRadius),
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.darkGreenColor,
                      AppColors.greenColor,
                      AppColors.lightGreenColor,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CircleClipper extends CustomClipper<Path> {
  final double radius;

  _CircleClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(covariant _CircleClipper oldClipper) =>
      oldClipper.radius != radius;
}
