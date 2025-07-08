import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/screens/home_screen/bottom_navigation_bar_screen.dart';
import 'package:lepster/widgets/custom_btn.dart';
import 'package:lepster/widgets/custom_snackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lepster/core/constants/text_style.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late final TextEditingController _otpController;
  String currentText = "";
  bool _isResendVisible = false;
  bool _isVerifyClicked = false;
  int _start = 30;
  Timer? _timer;

  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    startTimer();
  }

  void startTimer() {
    _isResendVisible = false;
    _start = 30;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isMounted) return; // prevent memory leak
      if (_start == 0) {
        setState(() => _isResendVisible = true);
        timer.cancel();
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006A5F);
    const Color accentColor = Color(0xFF00BFA6);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OTP Verification", style: primaryText20600),
              const SizedBox(height: 10),
              Text(
                "Enter the 6-digit code sent to your registered number.",
                textAlign: TextAlign.center,
                style: greyText13600,
              ),
              const SizedBox(height: 30),
              PinCodeTextField(
                appContext: context,
                controller: _otpController,
                length: 6,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (!_isMounted) return;
                  setState(() => currentText = value);
                },
                onCompleted: (val) {
                  debugPrint("Completed: $val");
                },
                animationType: AnimationType.fade,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 58,
                  fieldWidth: 48,
                  borderRadius: BorderRadius.circular(12),
                  activeColor: AppColors.primaryColor,
                  selectedColor: accentColor,
                  inactiveColor: AppColors.primaryLightColor,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isVerifyClicked
                    ? (_isResendVisible
                          ? GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.grey.shade600,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Resend OTP in $_start sec',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                    : const SizedBox(),
              ),
              const SizedBox(height: 40),
              CustomButton(
                title: "Verify OTP",
                onPressed: () {
                  setState(() => _isVerifyClicked = true);
                  showCustomSnackbar(
                    message: "OTP Verified Successfully",
                    context: context,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BottomNavigationBarScreen(),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 50,
              //   child: ElevatedButton(
              //     onPressed: currentText.length == 6
              //         ? () {
              //             setState(() => _isVerifyClicked = true);
              //             _showCustomSnackbar(
              //               "OTP Verified Successfully",
              //               accentColor,
              //             );
              //           }
              //         : null,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.primaryColor,
              //       foregroundColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(14),
              //       ),
              //       elevation: 3,
              //     ),
              //     child: const Text(
              //       "Verify OTP",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
