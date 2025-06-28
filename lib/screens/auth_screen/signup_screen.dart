import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/screens/auth_screen/signin_screen.dart';

import '../../widgets/custom_fields.dart';


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





  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }










  // void _validateEmail(String value) {
  //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //
  //   setState(() {
  //     if (value.isEmpty) {
  //       _emailError = 'Email is required';
  //     } else if (!emailRegex.hasMatch(value)) {
  //       _emailError = 'Enter a valid email';
  //     } else {
  //       _emailError = null;
  //     }
  //   });


  // Function to build text field
  // Widget _buildTextField({
  //   required String label,
  //   required String hint,
  //   required TextEditingController controller,
  //   TextInputType keyboardType = TextInputType.text,
  //   int? maxLength,
  //   String? errorText,
  //   VoidCallback? onChangedClearError,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8.0), // left/right corner radius
  //           border: Border(
  //             bottom: BorderSide(
  //               color: AppColors.  btnColor,
  //               width: 2, // only bottom border
  //             ),
  //           ),
  //         ),
  //         margin: const EdgeInsets.only(bottom: 2), // space between fields
  //         child: TextField(
  //           controller: controller,
  //           cursorColor: AppColors.  btnColor,
  //           keyboardType: keyboardType,
  //           textInputAction: TextInputAction.next,
  //           inputFormatters: maxLength != null
  //               ? [LengthLimitingTextInputFormatter(maxLength)]
  //               : [],
  //           onChanged: (value) {
  //             if (errorText != null && onChangedClearError != null) {
  //               onChangedClearError();
  //             }
  //           },
  //           decoration: InputDecoration(
  //             labelText: label,
  //             hintText: hint,
  //             labelStyle: TextStyle(color: AppColors.  btnColor),
  //             border: InputBorder.none, // no default border
  //             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
  //           ),
  //         ),
  //       ),
  //       Visibility(
  //         visible: errorText != null,
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 4, left: 8),
  //           child: Text(
  //             errorText ?? '',
  //             style: TextStyle(
  //               color: Colors.red,
  //               fontSize: 12,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }







  bool _obscurePassword = true;

String? _nameError;
String? _emailError;
String? _addressError;
String? _passwordError;

void _validateForm() {
  setState(() {
    _nameError = _nameController.text.isEmpty ? 'Please enter your name' : null;
    _emailError = _validateEmail(_emailController.text) ? null : 'Invalid email';
    _addressError = _addressController.text.isEmpty ? 'Please enter your address' : null;
    _passwordError = _passwordController.text.length < 6 ? 'Min 6 characters required' : null;

    if (_nameError == null && _emailError == null && _addressError == null && _passwordError == null) {
      // all fields valid —> proceed
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Address: ${_addressController.text}');
      print('Password: ${_passwordController.text}');

      Navigator.push(context, MaterialPageRoute(builder: (_) => SigninScreen()));
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: SingleChildScrollView(  // Add scroll to avoid overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      '$ev1',
                      height: 180,
                    ),
                  ),

                  const SizedBox(height: 8),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SigninScreen()),
                            );
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
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
