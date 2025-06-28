import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomImageSlider extends StatelessWidget {
  final List<String> imagePaths;

  const CustomImageSlider({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: imagePaths.map((imagePath) {
        return Container(
          width: screenWidth,

          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FittedBox(
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth, // Maintain full width, original height
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
