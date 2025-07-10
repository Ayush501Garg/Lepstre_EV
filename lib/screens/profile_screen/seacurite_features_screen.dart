import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/utils/shared_preference_service.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';

class AppSecurityScreen extends StatefulWidget {
  const AppSecurityScreen({super.key});

  @override
  State<AppSecurityScreen> createState() => _AppSecurityScreenState();
}

class _AppSecurityScreenState extends State<AppSecurityScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _alreadyVerified = false;
  IconData statusIcon = Icons.lock_outline;

  bool _theftModeEnabled = false;
  final String _staticEmergencyNumber = "8587968190";

  String _status = '';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
// <<<<<<< HEAD
    _checkPreviousAuthStatus(); // ✅ update

    print("User Verifyd ==> $_alreadyVerified");
// =======
    _checkPreviousAuthStatus();
    _loadTheftStatus();
// >>>>>>> 41c0719140c65fd09689ad66bdf5bfbfd8d551dc
  }

  Future<void> _checkPreviousAuthStatus() async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();
// <<<<<<< HEAD
    print('📦Fingerprint status  Previous fingerprint verified: $isVerified');

// =======
// >>>>>>> 41c0719140c65fd09689ad66bdf5bfbfd8d551dc
    setState(() {
      _alreadyVerified = isVerified;
      statusIcon = isVerified ? Icons.verified : Icons.person;
    });
  }

  Future<void> _authenticate() async {
// <<<<<<< HEAD
    print('👉Fingerprint status Fingerprint scan button clicked');

    setState(() {
      _isAuthenticating = true;
      _status = 'Touch the fingerprint sensor...';
    });

    print('🔐Fingerprint status Starting fingerprint authentication...');

// =======
// >>>>>>> 41c0719140c65fd09689ad66bdf5bfbfd8d551dc
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate',
        options: const AuthenticationOptions(biometricOnly: true),
      );

// <<<<<<< HEAD
      print('✅Fingerprint status Authentication result: $authenticated');

      // Save the result to SharedPreferences
      await SharedPrefManager.setFingerprintStatus(authenticated);
      print("🔐Fingerprint status Fingerprint authenticated and saved to SharedPrefs");

// =======
      await SharedPrefManager.setFingerprintStatus(authenticated);
// >>>>>>> 41c0719140c65fd09689ad66bdf5bfbfd8d551dc
      setState(() {
        _alreadyVerified = authenticated;
        statusIcon = authenticated ? Icons.verified : Icons.person;
      });
    } catch (_) {}
  }

  Future<void> _clearFingerprintStatus() async {
    await SharedPrefManager.setFingerprintStatus(false);
    setState(() {
      _alreadyVerified = false;
      statusIcon = Icons.person;
    });
  }

  Future<void> _loadTheftStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _theftModeEnabled = prefs.getBool("theft_safety") ?? false;
    setState(() {});
  }

  Future<void> _toggleTheftMode(bool value) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool("theft_safety", value);
    // setState(() {
    //   _theftModeEnabled = value;
    // });

    Future.delayed(const Duration(seconds: 10), () async {
      final permission = await Permission.phone.request();
      if (!permission.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone permission not granted")),
        );
        return;
      }

      await FlutterPhoneDirectCaller.callNumber(_staticEmergencyNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              verticalSpacing(20),
              BackBtnWithText(context: context, text: "Application Securities"),
              verticalSpacing(20),

// <<<<<<< HEAD
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
              ),

// =======
              // Fingerprint card
              Slidable(
                key: const ValueKey('fingerprint_card'),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.3,
                  children: [
                    SlidableAction(
                      onPressed: (_) async => await _clearFingerprintStatus(),
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
                  title: _alreadyVerified ? 'User Verified' : 'Verify Yourself',
                  subtitle: "Your identity is secured.",
                  glowColor: Colors.green,
                  onTap: _alreadyVerified ? null : _authenticate,
                ),
              ),

              verticalSpacing(20),

              // Theft safety switch
              CustomInfoCard(
                icon: Icons.shield_moon_outlined,
                title: "Theft Safety Mode",
                subtitle: "Enable emergency call on unauthorized EV movement.",
                glowColor: Colors.redAccent,
                toggleValue: _theftModeEnabled,
                onTap: () {
                  _toggleTheftMode(true);
                },
              ),
// >>>>>>> 41c0719140c65fd09689ad66bdf5bfbfd8d551dc
            ],
          ),
        ),
      ),
    );
  }
}

// CustomInfoCard with toggle support
class CustomInfoCard extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final IconData? lasticon;
  final String title;
  final String? subtitle;
  final Color glowColor;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  const CustomInfoCard({
    super.key,
    this.onTap,
    required this.icon,
    this.lasticon,
    required this.title,
    this.subtitle,
    this.glowColor = Colors.blue,
    this.toggleValue,
    this.onToggleChanged,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (toggleValue != null && onToggleChanged != null)
                        Switch(
                          value: toggleValue!,
                          onChanged: onToggleChanged,
                          activeColor: glowColor,
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
