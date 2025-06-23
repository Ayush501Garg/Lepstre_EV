import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/constants/app_color.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {



  void showImagePickerDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Update Profile Photo'),
        message: const Text('Choose an option'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // Call your camera method here
              print('Camera Clicked');
            },
            child: const Text('Take Photo',style: TextStyle(color: AppColors.primaryColor),),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // Call your gallery picker method here
              print('Gallery Clicked');
            },
            child: const Text('Choose from Gallery',style: TextStyle(color: AppColors.primaryColor),),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: const Text('Cancel',style: TextStyle(color: AppColors.primaryColor),),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: const Text(
      //     'Profile',
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: false,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Profile Picture
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LEFT SIDE - Image with Camera Icon

                Stack(
                  children: [
                    GestureDetector(
                      onLongPress: (){
                        showImagePickerDialog(context);
                      },

                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, width: 3),
                        ),
                        child: const CircleAvatar(
                          radius: 40,

                          backgroundImage: NetworkImage(
                            'https://tse2.mm.bing.net/th?id=OIP.Yh9XtpzimCmRolZuj98tKAHaHa&pid=Api&P=0&h=180',
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   bottom: 2,
                    //   right: 2,
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.green,
                    //     ),
                    //     padding: const EdgeInsets.all(5),
                    //     child: const Icon(
                    //       Icons.camera_alt,
                    //       color: Colors.white,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                // RIGHT SIDE - Name & Number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Rohit Saxena',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+91 9876543210',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'EV : Lepstre',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              'Full Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300, // light border color
                  width: 1,
                ),
              ),
              child: const Text(
                'Rohit Saxena',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),



            SizedBox(height: 10),

// Phone Number
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300, // light border color
                  width: 1,
                ),
              ),
              child: const Text(
                '+91 9876543210',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),

            SizedBox(height: 10),

// Email Address
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300, // light border color
                  width: 1,
                ),
              ),
              child: const Text(
                'rohit.saxena@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),


            const SizedBox(height: 10),


            const Text(
              'EV Scooter',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300, // light border color
                  width: 1,
                ),
              ),
              child: const Text(
                'LEPSTRE EV',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),


            const SizedBox(height: 20),

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


//  Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: AppColors.primaryColor, // border color
//                   width: 1,                      // border width 1 px
//                 ),
//               ),
//               child: DropdownButtonFormField<String>(
//                 value: 'Tesla Model X',
//                 items: const [
//                   DropdownMenuItem(
//                     value: 'Tesla Model X',
//                     child: Text('Tesla Model X'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Nissan Leaf',
//                     child: Text('Nissan Leaf'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Audi e-tron',
//                     child: Text('Audi e-tron'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Mercedes EQC',
//                     child: Text('Mercedes EQC'),
//                   ),
//                 ],
//                 onChanged: (value) {},
//                 decoration: const InputDecoration(
//                   border: InputBorder.none, // andar se koi border nahi, outer Container pe hai
//                 ),
//               ),
//             ),