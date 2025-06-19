// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigate to main screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Get Started Clicked!")));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/706/706830.png',
            title: 'Engage With Community',
            description:
                'Discuss, empower & share your electric moments. Join the EV conversation!',
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png',
            title: 'Track Your Ride',
            description:
                'Monitor your EV’s performance and stay in control every mile.',
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/146/146422.png',
            title: 'Smart Charging',
            description:
                'Locate nearby stations and charge your EV smartly and efficiently.',
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        "Get Started",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: const DotsDecorator(
        activeColor: Colors.green,
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
