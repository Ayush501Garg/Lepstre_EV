import 'package:flutter/material.dart';

/// Get full screen width
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get full screen height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Get width as a percentage of screen width
double getWidthPercent({required context, required percent}) {
  return MediaQuery.of(context).size.width * (percent / 100);
}

/// Get height as a percentage of screen height
double getHeightPercent({required context, required percent}) {
  return MediaQuery.of(context).size.height * (percent / 100);
}

/// Get EdgeInsets for horizontal padding based on screen width percentage
EdgeInsets horizontalPadding({required context, required percent}) {
  double padding = getWidthPercent(context: context, percent: percent);
  return EdgeInsets.symmetric(horizontal: padding);
}

/// Get EdgeInsets for vertical padding based on screen height percentage
EdgeInsets verticalPadding({required context, required percent}) {
  double padding = getHeightPercent(context: context, percent: percent);
  return EdgeInsets.symmetric(vertical: padding);
}

/// Get EdgeInsets for symmetric (horizontal + vertical) padding
EdgeInsets symmetricPadding({
  required context,
  required double horizontalPercent,
  required double verticalPercent,
}) {
  return EdgeInsets.symmetric(
    horizontal: getWidthPercent(context: context, percent: horizontalPercent),
    vertical: getHeightPercent(context: context, percent: verticalPercent),
  );
}

/// Vertical spacing based on percentage of screen height
SizedBox verticalSpacing(size) {
  return SizedBox(height: size);
}

/// Horizontal spacing based on percentage of screen width
SizedBox horizontalSpacing(size) {
  return SizedBox(width: size);
}
