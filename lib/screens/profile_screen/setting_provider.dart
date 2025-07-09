import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final Map<String, bool> _settings = {
    'deviceConnectivity': true,
    'viewPlans': true,
    'startStopEv': true,
    'speedLock': true,
    'lockEvApp': true,
    'batteryTracking': true,
    'chargingStation': true,
    'newRelease': true,
  };



  SettingsProvider() {
    _loadSettings();
  }

  bool getSetting(String key) => _settings[key] ?? false;

  Map<String, bool> getAllSettings() {
    return Map<String, bool>.from(_settings); // return a copy
  }

  bool isCardVisible(String key, bool isUserVerified) {
    final value = _settings[key] ?? false;
    return isUserVerified && value;
  }

  Future<void> toggleSetting(String key, bool value) async {
    _settings[key] = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);

    print("🔁 Toggle Updated -> $key: $value");

  }



  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _settings.updateAll((key, value) => prefs.getBool(key) ?? false);
    notifyListeners();
  }


}
