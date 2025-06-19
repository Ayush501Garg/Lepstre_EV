import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/constants/app_color.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Profile Picture
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 3),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://tse2.mm.bing.net/th?id=OIP.Yh9XtpzimCmRolZuj98tKAHaHa&pid=Api&P=0&h=180',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Full Name
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Update name',
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // border color
                    width: 1,           // 1-2 px ka border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // focused pe blue border
                    width: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Phone Number
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Update number',
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // border color
                    width: 1,           // 1-2 px ka border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // focused pe blue border
                    width: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Email Address
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'username/g-email',
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // border color
                    width: 1,           // 1-2 px ka border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor, // focused pe blue border
                    width: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Your EV Car (Dropdown)
            const Text(
              'Your EV Car',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primaryColor, // border color
                  width: 1,                      // border width 1 px
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: 'Tesla Model X',
                items: const [
                  DropdownMenuItem(
                    value: 'Tesla Model X',
                    child: Text('Tesla Model X'),
                  ),
                  DropdownMenuItem(
                    value: 'Nissan Leaf',
                    child: Text('Nissan Leaf'),
                  ),
                  DropdownMenuItem(
                    value: 'Audi e-tron',
                    child: Text('Audi e-tron'),
                  ),
                  DropdownMenuItem(
                    value: 'Mercedes EQC',
                    child: Text('Mercedes EQC'),
                  ),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  border: InputBorder.none, // andar se koi border nahi, outer Container pe hai
                ),
              ),
            ),


            const SizedBox(height: 30),

            // Update Button
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 2),
              child: Bounceable(
                onTap: () {
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
                    'submit Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
