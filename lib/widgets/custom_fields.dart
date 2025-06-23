import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_color.dart';  // apne color file ka path

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? errorText;
  final VoidCallback? onChangedClearError;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePasswordVisibility;
  final bool isPhone;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.errorText,
    this.onChangedClearError,
    this.onChanged,
    this.onSubmitted,
    this.isPassword = false,
    this.obscureText = false,
    this.togglePasswordVisibility,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          cursorColor: AppColors.primaryColor,
          keyboardType: isPhone ? TextInputType.phone : keyboardType,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            if (isPhone) FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(isPhone ? 10 : maxLength),
          ],
          onChanged: (value) {
            if (errorText != null && onChangedClearError != null) {
              onChangedClearError!();
            }
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(color: AppColors.primaryColor),
            floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.primaryColor,
              ),
              onPressed: togglePasswordVisibility,
            )
                : null,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            errorText: errorText,
            errorStyle: const TextStyle(
              fontSize: 10,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}



