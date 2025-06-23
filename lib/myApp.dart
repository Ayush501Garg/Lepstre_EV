import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepster/screens/auth_screen/signup_screen.dart';
import 'package:lepster/screens/home_screen/bottom_navigation_bar_screen.dart';
// import 'package:lepster/screens/home_screen/main_page.dart';
import 'package:lepster/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        // home: BottomNavigationBarScreen());
        // home: SignupScreen());
        home: SplashScreen());
  }
}