import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/utils/SharedPrefManager.dart';
import '../../provider/ToggleProvider.dart';
import '../../widgets/custome_switch_button.dart';

class AppSecurity extends StatefulWidget {
  const AppSecurity({super.key});



  @override
  State<AppSecurity> createState() => _AppSecurityState();
}



class _AppSecurityState extends State<AppSecurity> {

  final LocalAuthentication auth = LocalAuthentication();
  String _status = 'Not Authenticated';
  bool _isAuthenticating = false;

  bool _alreadyVerified = false;

  IconData statusIcon = Icons.lock_outline;



  @override
  void initState() {
    super.initState();
    _checkPreviousAuthStatus(); // ✅ update
  }


  Future<void> _checkPreviousAuthStatus() async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();
    print('📦 Previous fingerprint verified: $isVerified');

    setState(() {
      _status = isVerified ? '✅ You are a valid person' : '❌ Not Verified';
      print("isVerified  _checkPreviousAuthStatus isVerified : $isVerified");
      _alreadyVerified = isVerified;
      statusIcon = isVerified ? Icons.verified : Icons.person; // 👈 Update icon here
    });
  }

  // ✅ NEW: Method to clear saved fingerprint data
  Future<void> _clearFingerprintStatus() async {
    await SharedPrefManager.setFingerprintStatus(false);

    setState(() {
      _alreadyVerified = false;
      _status = 'Not Authenticated';
      statusIcon = Icons.person; // 👈 Reset icon to locked

      print("isVerified  _clearFingerprintStatus _alreadyVerified : $_alreadyVerified");
    });

    print('🧹 Fingerprint status cleared');
  }

  Future<void> _authenticate() async {
    print('👉 Fingerprint scan button clicked');

    setState(() {
      _isAuthenticating = true;
      _status = 'Touch the fingerprint sensor...';
    });

    print('🔐 Starting fingerprint authentication...');

    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      print('✅ Authentication result: $authenticated');

      // Save the result to SharedPreferences
      await SharedPrefManager.setFingerprintStatus(authenticated);
      print("🔐 Fingerprint authenticated and saved to SharedPrefs");

      setState(() {
        _isAuthenticating = false;
        _status = authenticated
            ? '✅ You are a valid person'
            : '❌ Access Denied!';
        _alreadyVerified = authenticated;
        statusIcon = authenticated ? Icons.verified : Icons.person; // 👈 Update icon
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
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            verticalSpacing(40),

            Slidable(
              key: const ValueKey('fingerprint_card'),

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.3,
                children: [
                  SlidableAction(
                    onPressed: (_) async {
                      await _clearFingerprintStatus(); // Will update icon too
                    },
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Remove User',
                    borderRadius: BorderRadius.circular(22),
                  ),
                ],
              ),

              child: CustomInfoCard(
                icon: statusIcon,
                title: _alreadyVerified ? 'User Verified' : 'Verify yourself',
                subtitle: "Your identity is secured.", // ✅ Dynamic icon
                glowColor: Colors.green,
                onTap: _alreadyVerified ? null : _authenticate,
              ),
            )




          ],
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.all(16),
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
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      if(lasticon != null)
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