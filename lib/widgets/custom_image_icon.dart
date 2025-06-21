import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';

class CustomImageIcon extends StatelessWidget {
  final dynamic onTap;
  final dynamic size;
  final dynamic image;
  const CustomImageIcon({super.key, this.onTap, this.size = 20, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparentColor,
      onTap: () {
        onTap();
      },
      child: Image.asset(image, width: size * 1.0, height: size * 1.0),
    );
  }
}
