import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/constants/app_color.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  bool _isResendVisible = false;
  bool _isVerifyButtonClicked = false;
  int _start = 30;
  Timer? _timer;
  TextEditingController _otpController = TextEditingController();
  String currentText = "";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isResendVisible = false;
      _start = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendVisible = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // appBar: AppBar(
      //   title: Text(
      //     'Verify OTP',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   backgroundColor: AppColors.  btnColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.  btnColor.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset('$ev1',height: 120,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.  btnColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Please enter the 6-digit code sent to your phone number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              PinCodeTextField(
                length: 6,
                appContext: context,
                controller: _otpController,
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                onCompleted: (value) {
                  // Handle OTP completion
                  print("Completed OTP: $value");
                },
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.  btnColor,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  borderWidth: 2,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: AppColors.  btnColor,
                  selectedColor: AppColors.  btnColor,
                  inactiveColor: Colors.grey.shade300,
                  disabledColor: Colors.grey.shade200,
                  errorBorderColor: Colors.red,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enablePinAutofill: true,
              ),
              const SizedBox(height: 40),
              _isVerifyButtonClicked
                  ? (_isResendVisible
                  ? GestureDetector(
                onTap: () {
                  startTimer();
                  // Add resend OTP logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('OTP resent successfully'),
                      backgroundColor: AppColors.  btnColor,
                    ),
                  );
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.  btnColor,
                  ),
                ),
              )
                  : Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Resend OTP in $_start seconds',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ))
                  : SizedBox.shrink(),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: currentText.length == 6 ? () {
                    setState(() {
                      _isVerifyButtonClicked = true;
                    });
                    startTimer();
                    // Handle OTP verification
                    print("Verifying OTP: $currentText");
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.  btnColor,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Verify OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
