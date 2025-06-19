import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/widgets/custom_image_icon.dart';

class ScooterCarousel extends StatefulWidget {
  const ScooterCarousel({super.key});

  @override
  State<ScooterCarousel> createState() => _ScooterCarouselState();
}

class _ScooterCarouselState extends State<ScooterCarousel> {
  int _currentIndex = 0;

  final List<Map<String, String>> scooters = [
    {'name': 'VAIO V150', 'image': ev1},
    {'name': 'Lepster Pro', 'image': ev2},
    {'name': 'E-Rider X', 'image': ev1},
  ];

  void _goToPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + scooters.length) % scooters.length;
    });
  }

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % scooters.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scooter = scooters[_currentIndex];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  CustomImageIcon(
                    image: leftArrowIcon,
                    size: 40,
                    onTap: () => _goToPrevious,
                  ),
                  const Spacer(),
                  CustomImageIcon(
                    image: rightArrowIcon,
                    size: 40,
                    onTap: () => _goToNext(),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    scooter['image']!,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    scooter['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
