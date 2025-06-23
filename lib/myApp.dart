import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lepster/screens/auth_screen/signup_screen.dart';
import 'package:lepster/screens/home_screen/bottom_navigation_bar_screen.dart';
// import 'package:lepster/screens/home_screen/main_page.dart';
import 'package:lepster/screens/splash_screen/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green, // Jo color chaahe tu de de
      statusBarIconBrightness: Brightness.light, // icons white chaahe to light
    ));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: BottomNavigationBarScreen());
        // home: SignupScreen());
        // home: SplashScreen());
  }
}