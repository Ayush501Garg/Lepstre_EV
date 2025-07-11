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

import '../../widgets/custom_switch.dart';
import '../../widgets/custom_toast.dart';

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
    _checkPreviousAuthStatus();
    _loadTheftStatus();
  }

  Future<void> _checkPreviousAuthStatus() async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();
    setState(() {
      _alreadyVerified = isVerified;
      statusIcon = isVerified ? Icons.verified : Icons.person;
    });
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      await SharedPrefManager.setFingerprintStatus(authenticated);
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
    setState(() => _theftModeEnabled = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("theft_safety", value);

    showCustomToast(
      context: context,
      message: value
          ? "🚨 Safety mode activated"
          : "⚠️ Safety mode deactivated",
      type: value ? ToastType.success : ToastType.warning,
    );

    if (value) {
      Future.delayed(const Duration(seconds: 10), () async {
        final permission = await Permission.phone.request();
        if (!permission.isGranted) {
          showCustomToast(
            context: context,
            message: "📵 Phone permission not granted",
            type: ToastType.error,
          );
          return;
        }
        await FlutterPhoneDirectCaller.callNumber(_staticEmergencyNumber);
      });
    }
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

              // Biometric Card
              Stack(
                children: [
                  CustomInfoCard(
                    icon: statusIcon,
                    title: _alreadyVerified
                        ? 'User Verified'
                        : 'Verify yourself',
                    subtitle: "Your identity is secured.",
                    glowColor: Colors.green,
                    onTap: _alreadyVerified ? null : _authenticate,
                  ),
                  if (_alreadyVerified)
                    Positioned(
                      right: 12,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: _clearFingerprintStatus,
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
              verticalSpacing(10),

              // Theft Safety Card with Custom Switch
              CustomInfoCard(
                icon: Icons.shield_moon_outlined,
                title: "Theft Safety Mode",
                subtitle: "Enable emergency call on unauthorized EV movement.",
                glowColor: Colors.redAccent,
                toggleValue: _theftModeEnabled,
                onToggleChanged: _toggleTheftMode,
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
  final String title;
  final String? subtitle;
  final Color glowColor;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  const CustomInfoCard({
    super.key,
    this.onTap,
    required this.icon,
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
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                        CustomSwitchButton(
                          value: toggleValue!,
                          onChanged: onToggleChanged,
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
