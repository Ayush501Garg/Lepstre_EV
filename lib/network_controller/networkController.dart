// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// // class NetworkController extends GetxController {
// //   // final Connectivity _connectivity = Connectivity();
// //   late StreamSubscription _subscription;
// //
// //   // var isOnline = true.obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     _checkInternetConnection();
// //     _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
// //   }
// //
// //   Future<void> _checkInternetConnection() async {
// //     var result = await _connectivity.checkConnectivity();
// //     _updateConnectionStatus(result); // ✅ single result
// //   }
// //
// //   void _updateConnectionStatus(ConnectivityResult result) {
// //     bool connected = result != ConnectivityResult.none;
// //
// //     if (!connected) {
// //       isOnline.value = false;
// //       _showNoInternetSnackbar();
// //     } else {
// //       isOnline.value = true;
// //       Get.closeAllSnackbars(); // optional
// //     }
// //   }
// //
// //   void _showNoInternetSnackbar() {
// //     Get.snackbar(
// //       "No Internet",
// //       "Please check your internet connection",
// //       snackPosition: SnackPosition.TOP,
// //       backgroundColor: Colors.red,
// //       colorText: Colors.white,
// //       duration: Duration(seconds: 3),
// //     );
// //   }
// //
// //   @override
// //   void onClose() {
// //     _subscription.cancel();
// //     super.onClose();
// //   }
// // }
