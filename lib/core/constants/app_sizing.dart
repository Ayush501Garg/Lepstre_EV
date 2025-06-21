import 'package:flutter/material.dart';

double screenHeight(context) {
  return MediaQuery.sizeOf(context).height;
}

double screenWidth(context) {
  return MediaQuery.sizeOf(context).width;
}

EdgeInsets horizontalPadding({required context, required padding}) {
  return EdgeInsets.symmetric(horizontal: padding * 1.0);
}

EdgeInsets verticalPadding({required context, required padding}) {
  return EdgeInsets.symmetric(vertical: padding * 1.0);
}

EdgeInsets symmetricPadding({
  required context,
  required double horizontalPercent,
  required double verticalPercent,
}) {
  return EdgeInsets.symmetric(
    horizontal: horizontalPercent * 1.0,
    vertical: verticalPercent * 1.0,
  );
}

SizedBox verticalSpacing(size) {
  return SizedBox(height: size * 1.0);
}

SizedBox horizontalSpacing(size) {
  return SizedBox(width: size * 1.0);
}
