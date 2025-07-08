import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:lepster/provider/ToggleProvider.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/screens/home_screen/bottom_navigation_bar_screen.dart';
import 'package:lepster/screens/new_screen.dart';
import 'package:lepster/screens/plan_screen/custome_plane_screen.dart';
import 'package:lepster/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/app_setting.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final toggleProvider = ToggleProvider();
  await toggleProvider.loadToggles();


  //  for multiple provider
  // final themeProvider = ThemeProvider(); // example
  // final authProvider = AuthProvider(); // example
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ToggleProvider>.value(value: toggleProvider),
        ],
        child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarScreen()
      // home: EV3DModelScreen()
      // home: DigitalWalletApp()
      // home: CustomePlaneScreen()
      // home: FingerprintAuthScreen(),
      // home: SplashScreen(),
    );
  }
}
