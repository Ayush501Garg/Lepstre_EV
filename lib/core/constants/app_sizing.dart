import 'package:flutter/material.dart';

/// Get full screen width
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get full screen height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Get EdgeInsets for horizontal padding based on screen width percentage
EdgeInsets horizontalPadding({required context, required padding}) {
  return EdgeInsets.symmetric(horizontal: padding);
}

/// Get EdgeInsets for vertical padding based on screen height percentage
EdgeInsets verticalPadding({required context, required padding}) {
  return EdgeInsets.symmetric(vertical: padding);
}

/// Get EdgeInsets for symmetric (horizontal + vertical) padding
EdgeInsets symmetricPadding({
  required context,
  required double horizontalPercent,
  required double verticalPercent,
}) {
  return EdgeInsets.symmetric(
    horizontal: horizontalPercent,
    vertical: verticalPercent,
  );
}

/// Vertical spacing based on percentage of screen height
SizedBox verticalSpacing(size) {
  return SizedBox(height: size * 1.0);
}

/// Horizontal spacing based on percentage of screen width
SizedBox horizontalSpacing(size) {
  return SizedBox(width: size * 1.0);
}
