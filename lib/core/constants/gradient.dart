import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';

// const appGradient = const LinearGradient(
//   colors: [
//     AppColors.darkGreenColor,
//     AppColors.greenColor,
//     AppColors.darkGreenColor,
//   ],
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
// );
// const appGradient = const LinearGradient(
//   colors: [Color(0XFF4BFF8E), Color(0XFF00E554), Color(0XFF048433)],
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
// );
// const appGradient = const LinearGradient(
//   colors: [AppColors.curvedColor, AppColors.greenColor, AppColors.whiteColor],
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
// );

// const appGradient = LinearGradient(
//   colors: [Color(0xff091e3a), Color(0xff356ab1), Color(0xff6aacd2)],
//   stops: [0, 0.5, 1],
//   begin: Alignment.bottomRight,
//   end: Alignment.topLeft,
// );
const appGradient = LinearGradient(
  colors: [Colors.tealAccent, AppColors.primaryLightColor],
  stops: [0, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
final appLightGradient = LinearGradient(
  colors: [
    Colors.tealAccent.withOpacity(0.5),
    AppColors.primaryLightColor.withOpacity(0.5),
  ],
  stops: [0, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
// final appGradient = LinearGradient(
//   colors: [
//     AppColors.primaryColor,
//     AppColors.primaryLightColor.withOpacity(0.5),
//   ],
//   stops: [0, 1],
//   begin: Alignment.bottomRight,
//   end: Alignment.topLeft,
// );
// const appGradient = LinearGradient(
//   colors: [
//     Color.fromRGBO(101, 93, 253, 1), // rgba(36, 25, 247, 1)
//     Color.fromRGBO(104, 104, 236, 1), // rgba(33, 33, 138, 1)
//     Color.fromRGBO(109, 220, 243, 1), // rgba(0, 212, 255, 1)
//   ],
//   begin: Alignment.bottomRight,
//   end: Alignment.topLeft,
//   stops: [0.0, 0.35, 1.0],
// );
