import 'package:flutter/material.dart';
import 'package:lepster/core/constants/image_path.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizing.dart';
import '../../../core/constants/text_style.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_text_field.dart';
import 'otp_verify_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  bool _showLoginButton = false;
  String? _phoneError;

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneError = 'Phone number is required';
        _showLoginButton = false;
      } else if (value.length != 10) {
        _phoneError = 'Enter a valid 10-digit phone number';
        _showLoginButton = false;
      } else {
        _phoneError = null;
        _showLoginButton = true;
      }
    });
  }

  void _onPhoneSubmitted() {
    if (_phoneController.text.length == 10) {
      setState(() {
        _showLoginButton = true;
      });
      _phoneFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Car Image
              Center(
                child: Image.asset(
                  onboarding3,
                  height: screenHeight(context) * 0.3,
                ),
              ),
              const SizedBox(height: 20),

              // Welcome Text
              Align(
                alignment: Alignment.center,
                child: Text('Welcome Back!', style: blackText30600),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.black87),
                      ),
                      WidgetSpan(child: horizontalSpacing(5)),
                      TextSpan(
                        text: 'Now',
                        style: TextStyle(color: AppColors.btnColor),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),
              CustomTextField(
                label: 'Phone Number',
                hint: 'Enter phone number',
                controller: _phoneController,
                errorText: _phoneError,
                isPhone: true,
                onChangedClearError: () {
                  setState(() {
                    _phoneError = null;
                  });
                },
                onChanged: (value) {
                  if (value.length == 10) {
                    FocusScope.of(context).unfocus(); // Hide keyboard
                    setState(() {
                      _showLoginButton = true;
                    });
                  } else {
                    setState(() {
                      _showLoginButton = false;
                    });
                  }
                },
                onSubmitted: (_) {
                  if (_phoneController.text.length == 10) {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _showLoginButton = true;
                    });
                  }
                },
              ),

              SizedBox(height: 20),

              // Login Button
              AnimatedOpacity(
                opacity: _showLoginButton ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap: _showLoginButton
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OTPVerificationScreen(),
                            ),
                          );
                          showCustomSnackbar(
                            message: 'Sending OTP to ${_phoneController.text}',
                            context: context,
                          );
                        }
                      : null,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.btnColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Divider Text
              Text('Or Continue with', style: greyText12600),
              const SizedBox(height: 20),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(facebook, height: 24),
                            const SizedBox(width: 10),
                            const Text(
                              'Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(google, height: 24),
                            const SizedBox(width: 10),
                            const Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: greyText14600),
                  GestureDetector(
                    onTap: () {
                      // Navigate to signup screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
