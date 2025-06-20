import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/screens/auth_screen/seond_signup_screen.dart';
import 'package:lepster/screens/auth_screen/signin_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final TextEditingController _field4Controller = TextEditingController();


  final FocusNode _field1Focus = FocusNode();
  final FocusNode _field2Focus = FocusNode();
  final FocusNode _field3Focus = FocusNode();
  final FocusNode _field4Focus = FocusNode();


  bool _showField2 = false;
  bool _showField3 = false;
  bool _showField4 = false;
  bool _showContinueButton = false;



  void dispose() {
    _field1Controller.dispose();
    _field2Controller.dispose();
    _field3Controller.dispose();
    _field4Controller.dispose();
    _field1Focus.dispose();
    _field2Focus.dispose();
    _field3Focus.dispose();
    _field4Focus.dispose();
    super.dispose();
  }



  void _onFieldSubmitted(int fieldNumber) {
    setState(() {
      switch (fieldNumber) {
        case 1:
          if (_field1Controller.text.isNotEmpty) {
            _showField2 = true;
            // Focus on next field after a small delay
            Future.delayed(const Duration(milliseconds: 100), () {
              _field2Focus.requestFocus();
            });
          }
          break;
        case 2:
          if (_field2Controller.text.isNotEmpty) {
            _showField3 = true;
            Future.delayed(const Duration(milliseconds: 100), () {
              _field3Focus.requestFocus();
            });
          }
          break;
        case 3:
          if (_field3Controller.text.isNotEmpty) {
            _showField4 = true;
            Future.delayed(const Duration(milliseconds: 100), () {
              _field4Focus.requestFocus();
            });
          }
          break;
        case 4:
          if (_field4Controller.text.isNotEmpty) {
            _showContinueButton = true;
            _field4Focus.unfocus(); // Remove focus from last field
          }
          break;
      }
    });
  }

  String? _emailError;

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    setState(() {
      if (value.isEmpty) {
        _emailError = 'Email is required';
      } else if (!emailRegex.hasMatch(value)) {
        _emailError = 'Enter a valid email';
      } else {
        _emailError = null;
      }
    });
  }

  // Function to build text field
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required int fieldNumber,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    String? errorText, // <-- add this
  }) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      inputFormatters: maxLength != null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : [],
      onSubmitted: (value) => _onFieldSubmitted(fieldNumber),
      onChanged: (value) {
        if (fieldNumber == 3) {
          _validateEmail(value);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: AppColors.primaryColor),
        errorText: errorText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(1), width: 2),
        ),
      ),
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Lepster ⚡ EV',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/car_singup.png', // Replace with your fakeimg
                  height: 180,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi User,',
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
                  'Sign up Now',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Field 1 - Phone Number (Always visible)
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                label: 'Phone Number',
                hint: '',
                controller: _field1Controller,
                focusNode: _field1Focus,
                fieldNumber: 1,
                keyboardType: TextInputType.phone,
                maxLength: 10,  // limit to 10 digits
              ),

              // Field 2 - Shows after field 1 is filled
              if (_showField2) ...[
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: _showField2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _buildTextField(
                    label: 'Enter Name',
                    hint: 'Enter Your Name',
                    controller: _field2Controller,
                    focusNode: _field2Focus,
                    fieldNumber: 2,
                  ),
                ),
              ],

              // Field 3 - Shows after field 2 is filled
              if (_showField3) ...[
                const SizedBox(height: 0),
                AnimatedOpacity(
                  opacity: _showField3 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _buildTextField(
                    label: 'Enter Email',
                    hint: 'Enter Your Email',
                    controller: _field3Controller,
                    focusNode: _field3Focus,
                    fieldNumber: 3,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],

              // Field 4 - Shows after field 3 is filled
              if (_showField4) ...[
                const SizedBox(height: 0),
                AnimatedOpacity(
                  opacity: _showField4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _buildTextField(
                    label: 'Enter Address',
                    hint: 'Enter Your Address',
                    controller: _field4Controller,
                    focusNode: _field4Focus,
                    fieldNumber: 4,
                  ),
                ),
              ],

              const SizedBox(height: 32),

              // Continue Button - Shows after all fields are filled
              // if (_showContinueButton)
                AnimatedOpacity(
                  opacity: _showContinueButton ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () {
                      // Collect all data
                      print('Phone: ${_field1Controller.text}');
                      print('Name: ${_field2Controller.text}');
                      print('Email: ${_field3Controller.text}');
                      print('Address: ${_field4Controller.text}');

                      // Navigate to next screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AuthScreen())
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue, // Replace with AppColors.primaryColor
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
                ),

              const SizedBox(height: 24),
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
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AuthScreen())
                        );
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
