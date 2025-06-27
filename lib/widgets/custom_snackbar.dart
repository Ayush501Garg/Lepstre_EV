import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';

void showCustomSnackbar({required message, color, required context}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
    backgroundColor: color ?? AppColors.primaryColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
