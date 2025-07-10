// import 'package:flutter/material.dart';
// import '../core/constants/app_color.dart';
// import '../core/constants/text_style.dart';
//
// enum ToastType { success, error, info, warning }
//
// void showCustomToast({
//   required BuildContext context,
//   required String message,
//   ToastType type = ToastType.info,
// }) {
//   IconData icon;
//   Color color;
//   Color bgColor;
//   Color progressColor;
//   Color textColor = Colors.black;
//
//   switch (type) {
//     case ToastType.success:
//       icon = Icons.check_circle;
//       color = AppColors.greenColor;
//       bgColor = const Color(0xFFE6F4EA); // Light green bg
//       progressColor = AppColors.greenColor;
//       break;
//     case ToastType.error:
//       icon = Icons.error;
//       color = Colors.redAccent;
//       bgColor = const Color(0xFFFFEBEE); // Light red bg
//       progressColor = Colors.redAccent;
//       break;
//     case ToastType.info:
//       icon = Icons.info;
//       color = AppColors.primaryColor;
//       bgColor = const Color(0xFFE3F2FD); // Light blue bg
//       progressColor = AppColors.primaryColor;
//       break;
//     case ToastType.warning:
//       icon = Icons.warning;
//       color = Colors.amber.shade800;
//       bgColor = const Color(0xFFFFF8E1); // Light yellow bg
//       progressColor = Colors.amber.shade800;
//       break;
//   }
//
//   toastification.show(
//     context: context,
//     title: Text(
//       message,
//       style: blackText14600.copyWith(fontSize: 14, color: textColor),
//     ),
//     icon: Icon(icon, color: color, size: 24),
//     type: switch (type) {
//       ToastType.success => ToastificationType.success,
//       ToastType.error => ToastificationType.error,
//       ToastType.info => ToastificationType.info,
//       ToastType.warning => ToastificationType.warning,
//     },
//     style: ToastificationStyle.flat,
//     autoCloseDuration: const Duration(seconds: 3),
//     alignment: Alignment.topCenter,
//     borderRadius: BorderRadius.circular(14),
//     backgroundColor: bgColor,
//     showProgressBar: true,
//     progressBarTheme: ProgressIndicatorThemeData(
//       color: progressColor,
//       linearTrackColor: bgColor,
//     ),
//     closeButtonShowType: CloseButtonShowType.onHover,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//     animationDuration: const Duration(milliseconds: 300),
//     animationBuilder: (context, animation, alignment, child) {
//       return SlideTransition(
//         position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
//             .animate(
//               CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
//             ),
//         child: child,
//       );
//     },
//   );
// }
