// import 'package:flutter/cupertino.dart';
//
// import '../utils/SharedPrefManager.dart';
//
// class AppSettings {
//   // static bool showHiddenWidget = true;
//   // static ValueNotifier<bool> showHiddenWidget = ValueNotifier(false);
//
//   static ValueNotifier<bool> notification = ValueNotifier(false);
//   static ValueNotifier<bool> device_connection = ValueNotifier(false);
//   static ValueNotifier<bool> plan_card = ValueNotifier(false);
//
//
//   // Load all toggles at app start
//   static Future<void> loadAllSettings() async {
//     notification.value = await SharedPrefManager.getToggle("notification");
//     device_connection.value = await SharedPrefManager.getToggle("device_connection");
//     plan_card.value = await SharedPrefManager.getToggle("plan_card");
//   }
//
//   // Optional: Individual setters
//   static void setNotification(bool value) {
//     notification.value = value;
//     SharedPrefManager.setToggle("notification", value);
//   }
//
//
//
//   static void setDevice_connection(bool value) {
//     device_connection.value = value;
//     SharedPrefManager.setToggle("device_connection", value);
//   }
//
//
//
//   static void setPlan_card(bool value) {
//     plan_card.value = value;
//     SharedPrefManager.setToggle("plan_card", value);
//   }
//
//
//
// }