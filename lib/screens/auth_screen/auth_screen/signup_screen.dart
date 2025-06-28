import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';

import '../../../widgets/custom_text_field.dart';
import 'signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final FocusNode _field1Focus = FocusNode();
  // final FocusNode _field2Focus = FocusNode();
  // final FocusNode _field3Focus = FocusNode();
  // final FocusNode _field4Focus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  bool _obscurePassword = true;

  String? _nameError;
  String? _emailError;
  String? _addressError;
  String? _passwordError;

  void _validateForm() {
    setState(() {
      _nameError = _nameController.text.isEmpty
          ? 'Please enter your name'
          : null;
      _emailError = _validateEmail(_emailController.text)
          ? null
          : 'Invalid email';
      _addressError = _addressController.text.isEmpty
          ? 'Please enter your address'
          : null;
      _passwordError = _passwordController.text.length < 6
          ? 'Min 6 characters required'
          : null;

      if (_nameError == null &&
          _emailError == null &&
          _addressError == null &&
          _passwordError == null) {
        // all fields valid —> proceed

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SignInScreen()),
        );
      }
    });
  }

  bool _validateEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 48.0,
            ),
            child: SingleChildScrollView(
              // Add scroll to avoid overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      onboarding3,
                      height: screenHeight(context) * 0.3,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Sign ',
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: 'up',
                            style: TextStyle(color: AppColors.btnColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // NAME
                  CustomTextField(
                    label: 'Enter Name',
                    hint: 'Name',
                    controller: _nameController,
                    errorText: _nameError,
                    onChangedClearError: () {
                      setState(() {
                        _nameError = null;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // EMAIL
                  CustomTextField(
                    label: 'Enter Email',
                    hint: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                    onChangedClearError: () {
                      setState(() {
                        _emailError = null;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // ADDRESS
                  CustomTextField(
                    label: 'Enter Address',
                    hint: 'Address',
                    controller: _addressController,
                    errorText: _addressError,
                    onChangedClearError: () {
                      setState(() {
                        _addressError = null;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // PASSWORD
                  CustomTextField(
                    label: 'Enter Password',
                    hint: 'Password',
                    controller: _passwordController,
                    errorText: _passwordError,
                    isPassword: true,
                    obscureText: _obscurePassword,
                    togglePasswordVisibility: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    onChangedClearError: () {
                      setState(() {
                        _passwordError = null;
                      });
                    },
                  ),

                  const SizedBox(height: 32),

                  // CONTINUE BUTTON
                  GestureDetector(
                    onTap: () {
                      _validateForm();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.btnColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: greyText14600),
                      GestureDetector(
                        onTap: () {
                          // Navigate to signup screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignInScreen()),
                          );
                        },
                        child: Text(
                          'Sign In',
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
        ),
      ),
    );
  }
}
