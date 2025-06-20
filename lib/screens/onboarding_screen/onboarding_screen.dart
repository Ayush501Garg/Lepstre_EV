import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/screens/home_screen/home_screen.dart';
import 'widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl:
                'https://cdn.pixabay.com/photo/2023/04/04/11/29/electric-vehicle-7897396_1280.png',
            title: 'Engage With Community',
            description:
                'Discuss, empower & share your electric moments. Join the EV conversation!',
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl:
                'https://cdn.pixabay.com/photo/2020/06/15/18/03/bike-5302756_1280.png',
            title: 'Track Your Ride',
            description:
                'Monitor your EV’s performance and stay in control every mile.',
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: OnboardingPage(
            imageUrl:
                'https://cdn.pixabay.com/photo/2023/01/27/12/28/electric-7746909_1280.png',
            title: 'Smart Charging',
            description:
                'Locate stations and charge your EV smartly and efficiently.',
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      next: Container(
        color: AppColors.primaryColor,
        child: const Icon(Icons.arrow_forward),
      ),
      back: Container(
        color: AppColors.primaryColor,
        child: const Icon(Icons.arrow_forward),
      ),
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
