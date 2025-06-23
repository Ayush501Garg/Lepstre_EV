import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';

Widget customBackButton({icon = Icons.arrow_back_ios_new, required onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(30),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
        boxShadow: [BoxShadow(color: AppColors.curvedColor, blurRadius: 2)],
      ),
      child: Icon(icon, color: AppColors.darkGreenColor, size: 20),
    ),
  );
}
