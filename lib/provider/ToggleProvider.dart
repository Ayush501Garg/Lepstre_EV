import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../core/utils/SharedPrefManager.dart';

class ToggleProvider extends ChangeNotifier {
  Map<String, bool> _toggles = {
    "notification": true,
    "device_connection": true,
    "user_verify": true,
    "plan_card": true,
  };



  // Getter
  bool getToggle(String key) => _toggles[key] ?? false;



  // Setter + Save + Notify
  // Future<void> setToggle(String key, bool value) async {
  //   _toggles[key] = value;
  //   notifyListeners();
  //
  //   // 🟢 Use SharedPrefManager here
  //   await SharedPrefManager.setToggle(key, value);
  // }

  Future<void> updateToggleWithVerification(BuildContext context, String key, bool value) async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();

    if (!isVerified) {
      print("❌ Access Denied: You are not a verified user."); // Centralized check

      MotionToast.error(
        title: const Text(
          "Verification Required",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        description: const Text("Please verify yourself. It’s app security policy."),
        animationType: AnimationType.slideInFromTop,
        dismissable: true,
        barrierColor: Colors.black.withOpacity(0.1),
      ).show(context);

      return;
    }

    _toggles[key] = value;
    notifyListeners();
    await SharedPrefManager.setToggle(key, value);
    print('✅ Toggle updated for $key → $value');
  }

  Future<void> resetAllTogglesIfUnverified() async {
    bool isVerified = await SharedPrefManager.getFingerprintStatus();

    if (!isVerified) {
      // Disable all toggles
      for (String key in _toggles.keys) {
        _toggles[key] = false;
        await SharedPrefManager.setToggle(key, false);
      }
      notifyListeners();
      print("🔒 All toggles disabled due to unverified status");
    }
  }


  // Initial Load
  Future<void> loadToggles() async {
    // 🟢 Use SharedPrefManager here
    final storedToggles = await SharedPrefManager.loadToggleStates();

    // overwrite with stored values
    _toggles.addAll(storedToggles);

    notifyListeners();
  }
}
