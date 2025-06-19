import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lepster/screens/onboarding_screen/onboarding_screen.dart';
import 'package:lepster/screens/profile_screen/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for fade in
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    // Navigate after delay
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (_) => OnboardingScreen()),
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 242, 10),
              Color.fromARGB(255, 123, 245, 129),
            ], // green → light green
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Image.asset('assets/logo.png', width: 150, height: 150),
          ),
        ),
      ),
    );
  }
}

// Dummy HomeScreen to demonstrate navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Home Screen')));
  }
}
