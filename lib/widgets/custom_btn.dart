import 'package:flutter/material.dart';
import 'package:lepster/core/constants/text_style.dart';
import '../core/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final dynamic textStyle;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(vertical: 14),
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: textStyle ?? whiteText16600),
      ),
    );
  }
}
