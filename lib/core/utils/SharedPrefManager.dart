import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const String _toggleKey = "toggle_states";

  static const String _fingerprintKey = "fingerprint_auth";




  // Save fingerprint status
  static Future<void> setFingerprintStatus(bool isAuthenticated) async {
    await setToggle(_fingerprintKey, isAuthenticated);
  }

  // Get fingerprint status
  static Future<bool> getFingerprintStatus() async {
    return await getToggle(_fingerprintKey);
  }


  // Load all toggle states
  static Future<Map<String, bool>> loadToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_toggleKey);

    if (data == null) return {}; // default empty

    final Map<String, dynamic> map = jsonDecode(data);
    return map.map((key, value) => MapEntry(key, value as bool));
  }

  // Get value for a specific toggle
  static Future<bool> getToggle(String name) async {
    final map = await loadToggleStates();
    return map[name] ?? false;
  }

  // Save or update a toggle value
  static Future<void> setToggle(String name, bool value ) async {
    final prefs = await SharedPreferences.getInstance();
    final map = await loadToggleStates();

    map[name] = value;

    final newData = jsonEncode(map);
    await prefs.setString(_toggleKey, newData);
  }
}
