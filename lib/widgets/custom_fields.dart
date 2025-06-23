import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? errorText;
  final VoidCallback? onChangedClearError;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? togglePasswordVisibility;
  final bool isPhone; // <<== new parameter

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.errorText,
    this.onChangedClearError,
    this.isPassword = false,
    this.obscureText = false,
    this.togglePasswordVisibility,
    this.isPhone = false, // default false
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
          textInputAction: TextInputAction.next,
          inputFormatters: [
            if (isPhone)
              FilteringTextInputFormatter.digitsOnly,
            if (maxLength != null || isPhone)
              LengthLimitingTextInputFormatter(isPhone ? 10 : maxLength),
          ],
          onChanged: (value) {
            if (errorText != null && onChangedClearError != null) {
              onChangedClearError!();
            }
          },
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(color: AppColors.primaryColor),
            floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
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

        Visibility(
          visible: errorText != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 1, left: 8),
            child: Text(
              errorText ?? '',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
