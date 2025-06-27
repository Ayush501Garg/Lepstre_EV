import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lepster/screens/auth_screen/otp_verify_screen.dart';
import 'package:lepster/screens/auth_screen/signin_screen.dart';
import 'package:lepster/screens/auth_screen/signup_screen.dart';
import 'package:lepster/screens/home_screen/bottom_navigation_bar_screen.dart';

import 'network_controller/networkController.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Jo bhi color chahiye de do yaha
    statusBarIconBrightness: Brightness.dark, // white icons (for dark background)
    // Brightness.dark agar light background ho
  ));

  Get.put(NetworkController());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: OTPVerificationScreen());
        home: BottomNavigationBarScreen());
    // home: SigninScreen());
    // home: SplashScreen());
  }
}

