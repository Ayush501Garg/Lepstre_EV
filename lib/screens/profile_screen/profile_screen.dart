import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:lepster/screens/profile_screen/privacy_screen.dart';

import '../../core/constants/app_color.dart';
import 'next_screen/demo_next_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor, // or any Color
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // title center me ho
        elevation: 4, // shadow effect under appbar
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10),
        //     child: Bounceable(
        //       onTap: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const NextScreen()),
        //       ),
        //       child: const Text('Next',
        //         style: TextStyle(color: Colors.white)
        //       ),
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(4), // border thickness
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // border color
                      width: 4, // border width
                    ),
                    boxShadow: [],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://tse2.mm.bing.net/th?id=OIP.Yh9XtpzimCmRolZuj98tKAHaHa&pid=Api&P=0&h=180',
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Text(
              'Lepstre EV',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'lepstreev@gmail.com',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 20),

            SizedBox(height: 30),
            buildMenuItem(Icons.call, 'No. 12321987654', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyScreen()),
              );
            }),
            buildMenuItem(Icons.mail, 'Gmail - lepstreev@gmail.com', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyScreen()),
              );
            }),
            buildMenuItem(Icons.help_outline, 'Help & Support', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyScreen()),
              );
            }),
            buildMenuItem(Icons.privacy_tip, 'Privacy', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyScreen()),
              );
            }),
            buildMenuItem(Icons.logout, 'Logout', () {
              // Logout logic
              print('Logout tapped');
            }, isLogout: true),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Bounceable(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextScreen()),
                  );
                  // your action here
                  print('Upgrade to Pro Clicked!');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor, // yellow button
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Card(
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }



}
