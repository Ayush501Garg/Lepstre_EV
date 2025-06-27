import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';

Widget customBackButton({
  icon = Icons.arrow_back_ios_new,
  onTap,
  bgColor,
  isShadow = true,
  iconColor,
  padding = 10,
  context,
}) {
  return InkWell(
    onTap: () {
      if (onTap != null) {
        onTap();
      } else {
        Navigator.pop(context);
      }
    },

    borderRadius: BorderRadius.circular(30),
    child: Container(
      padding: EdgeInsets.all(padding * 1.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? AppColors.whiteColor,
        boxShadow: !isShadow
            ? null
            : [BoxShadow(color: AppColors.curvedColor, blurRadius: 2)],
      ),
      child: Icon(icon, color: iconColor ?? AppColors.darkGreenColor, size: 20),
    ),
  );
}
