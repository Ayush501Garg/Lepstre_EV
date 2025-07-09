import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:local_auth/local_auth.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/utils/shared_preference_service.dart';

class AppSecurityScreen extends StatefulWidget {
  const AppSecurityScreen({super.key});

  @override
  State<AppSecurityScreen> createState() => _AppSecurityScreenState();
}

class _AppSecurityScreenState extends State<AppSecurityScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _status = 'Not Authenticated';
  bool _isAuthenticating = false;

  bool _alreadyVerified = false;

  IconData statusIcon = Icons.lock_outline;

  @override
  void initState() {
    super.initState();
    _checkPreviousAuthStatus(); // ✅ update

    print("User Verifyd ==> $_alreadyVerified");
  }

  Future<void> _checkPreviousAuthStatus() async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();
    print('📦Fingerprint status  Previous fingerprint verified: $isVerified');

    setState(() {
      _status = isVerified ? '✅ You are a valid person' : '❌ Not Verified';
      print("isVerified  _checkPreviousAuthStatus isVerified : $isVerified");
      _alreadyVerified = isVerified;
      statusIcon = isVerified
          ? Icons.verified
          : Icons.person; // 👈 Update icon here
    });
  }

  // ✅ NEW: Method to clear saved fingerprint data
  Future<void> _clearFingerprintStatus() async {
    await SharedPrefManager.setFingerprintStatus(false);

    setState(() {
      _alreadyVerified = false;
      _status = 'Not Authenticated';
      statusIcon = Icons.person; // 👈 Reset icon to locked

      print(
        "isVerified  _clearFingerprintStatus _alreadyVerified : $_alreadyVerified",
      );
    });

    print('🧹 Fingerprint status cleared');
  }

  Future<void> _authenticate() async {
    print('👉Fingerprint status Fingerprint scan button clicked');

    setState(() {
      _isAuthenticating = true;
      _status = 'Touch the fingerprint sensor...';
    });

    print('🔐Fingerprint status Starting fingerprint authentication...');

    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      print('✅Fingerprint status Authentication result: $authenticated');

      // Save the result to SharedPreferences
      await SharedPrefManager.setFingerprintStatus(authenticated);
      print("🔐Fingerprint status Fingerprint authenticated and saved to SharedPrefs");

      setState(() {
        _isAuthenticating = false;
        _status = authenticated
            ? '✅ You are a valid person'
            : '❌ Access Denied!';
        _alreadyVerified = authenticated;
        statusIcon = authenticated
            ? Icons.verified
            : Icons.person; // 👈 Update icon
        print("isVerified  _authenticate authenticated : $authenticated");
      });
    } catch (e) {
      print('❌ Error occurred during authentication: $e');
      setState(() {
        _isAuthenticating = false;
        _status = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ icon based on verification

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              verticalSpacing(20),
              BackBtnWithText(
                context: context,
                text: "Application Securities ",
              ),

              verticalSpacing(20),

              Stack(
                children: [
                  CustomInfoCard(
                    icon: statusIcon,
                    title: _alreadyVerified ? 'User Verified' : 'Verify yourself',
                    subtitle: "Your identity is secured.",
                    glowColor: Colors.green,
                    onTap: _alreadyVerified ? null : _authenticate,
                  ),

                  // ✅ Show close icon only if verified
                  if (_alreadyVerified)
                    Positioned(
                      right: 12,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          await _clearFingerprintStatus();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 2),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

class CustomInfoCard extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final IconData? lasticon;
  final String title;
  final String? subtitle;
  final Color glowColor;

  const CustomInfoCard({
    super.key,
    this.onTap,
    required this.icon,
    this.lasticon,
    required this.title,
    this.subtitle,
    this.glowColor = Colors.blue, // default color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Glow Icon Circle (keep original static icon)
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    glowColor.withOpacity(0.4),
                    glowColor.withOpacity(0.05),
                  ],
                ),
              ),
              child: Icon(icon, size: 32, color: glowColor),
            ),
            const SizedBox(width: 18),

            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (lasticon != null)
                        Icon(
                          lasticon, // ✅ Yeh important line hai
                          size: 24,
                          color: Colors.black54,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.3,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
