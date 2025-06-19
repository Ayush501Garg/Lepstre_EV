// lib/widgets/onboarding_page.dart
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00C853), Color(0xFFA5D6A7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            ),
            child: Center(child: Image.network(imageUrl, height: 250)),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
