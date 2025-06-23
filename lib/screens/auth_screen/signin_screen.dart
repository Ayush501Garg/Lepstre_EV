import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lepster/screens/auth_screen/otp_verify_screen.dart';
import 'package:lepster/screens/auth_screen/signup_screen.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/image_path.dart';
import '../../widgets/custom_fields.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      focusNode: _phoneFocus,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.primaryColor,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onSubmitted: (value) => _onPhoneSubmitted(),
      onChanged: (value) => _validatePhone(value),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter Phone Number',
        labelStyle: TextStyle(color: AppColors.primaryColor),
        errorText: _phoneError,
        prefixIcon: Icon(Icons.phone, color: AppColors.primaryColor.withOpacity(1)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(1), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
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
                  '$ev1',
                  height: 180,
                ),
              ),
              const SizedBox(height: 40),

              // Welcome Text
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login to Continue',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Phone Number Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Your Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
               SizedBox(height: 12),
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
              ),


              SizedBox(height: 32),

              // Login Button
              AnimatedOpacity(
                opacity: _showLoginButton ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap: _showLoginButton ? () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => OTPVerificationScreen()));
                    // Handle login logic here
                    print('Login with phone: ${_phoneController.text}');

                    // Show loading or navigate to OTP screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sending OTP to ${_phoneController.text}'),
                        backgroundColor: AppColors.primaryColor,
                      ),
                    );
                    // Navigate to OTP verification screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => OtpVerificationScreen(
                    //       phoneNumber: _phoneController.text,
                    //     ),
                    //   ),
                    // );
                  } : null,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _showLoginButton
                          ? AppColors.primaryColor
                          : Colors.grey.shade400,
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
              const Text(
                'Or Continue with',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle Facebook login
                        print('Login with Facebook');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://tse3.mm.bing.net/th?id=OIP.aubU2lXxC1ZmPDdf-koomwHaH_&pid=Api&P=0&h=180',
                              height: 24,
                            ),
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
                      onTap: () {
                        // Handle Google login
                        print('Login with Google');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://tse3.mm.bing.net/th?id=OIP.aPyHWMu3KHjwJUWdGrEkZQHaHa&pid=Api&P=0&h=180',
                              height: 24,
                            ),
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

              const SizedBox(height: 32),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
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
