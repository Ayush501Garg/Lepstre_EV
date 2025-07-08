import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/screens/home_screen/home_screen.dart';

import '../bikes_screen/bikes_screen.dart';
import '../history_screen/history_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../scan_screen/scan_screen.dart';
import 'history_screen.dart' hide HistoryScreen;

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BikesScreen(),
    ScanScreen(),
    History_Screen(),
// <<<<<<< HEAD
//     ElectricScooterScreen(),
    // DemoHomeScreen(title: "Profile"),
// =======
    ProfileScreen(),

// >>>>>>> ayush_garg
  ];

  final List<TabItem> items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.directions_bike, title: 'Bike'),
    TabItem(icon: Icons.qr_code_scanner, title: 'Scan'),
    TabItem(icon: Icons.history, title: 'History'),
    TabItem(icon: Icons.person, title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[currentIndex],
      bottomNavigationBar: BottomBarInspiredOutside(
        height: 60,
        items: items,
        indexSelected: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 25,
        sizeInside: 45,
        chipStyle: const ChipStyle(
          background: AppColors.primaryColor,
          size: 10.0,
          notchSmoothness: NotchSmoothness.softEdge,
        ),
        pad: 0,
        padTop: 5,
        padbottom: 5,
        itemStyle: ItemStyle.circle,
        titleStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        color: AppColors.greyColor,
        colorSelected: AppColors.backgroundColor,
        backgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}

// Placeholder screen
