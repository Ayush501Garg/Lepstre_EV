import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';

// class CustomSwitchButton extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool> onChanged;
//   final Color activeThumbColor;
//   final Color activeTrackColor;
//   final Color inactiveThumbColor;
//   final Color inactiveTrackColor;
//   const CustomSwitchButton({
//     super.key,
//     required this.value,
//     required this.onChanged,
//     this.activeThumbColor = AppColors.primaryColor,
//     this.activeTrackColor = AppColors.lightCreame,
//     this.inactiveThumbColor = Colors.grey,
//     this.inactiveTrackColor = AppColors.lightCreame,
//   });
//   @override
//   Widget build(BuildContext context) {
//       value: value,
//       onChanged: onChanged,
//       activeColor: activeThumbColor,
//       activeTrackColor: activeTrackColor.withOpacity(0.6),
//       inactiveThumbColor: inactiveThumbColor,
//       inactiveTrackColor: inactiveTrackColor,
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//     );
//   }
// }

class CustomSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged; // Nullable
  final bool isEnabled;

  final Color activeThumbColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
    this.activeThumbColor = AppColors.primaryColor,
    this.activeTrackColor = AppColors.lightCreame,
    this.inactiveThumbColor = Colors.grey,
    this.inactiveTrackColor = AppColors.lightCreame,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.4,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: Container(
          height: 32,
          width: 52,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor, width: 1.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: activeThumbColor,
            activeTrackColor: activeTrackColor.withOpacity(0.6),
            inactiveThumbColor: inactiveThumbColor,
            inactiveTrackColor: inactiveTrackColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    );
  }
}