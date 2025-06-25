import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/image_path.dart';

class ElectricScooterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Custom AppBar
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side title
                  Text(
                    "llham's Gova 3",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Right side CircleAvatar
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.v6vNYVTasQz8hsV6xm_ndAHaEK&pid=Api&P=0&h=180'), // Put your image path here
                    backgroundColor: Colors.grey[300], // fallback color
                  ),


                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Left side icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(Icons.bluetooth, color: Colors.green, size: 24),
                      SizedBox(width: 12),
                      Icon(Icons.wifi, color: Colors.green, size: 24),
                    ],
                  ),
                ),
                // Right side text
                Text(
                  "Connected, Active",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 30,left: 30),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                         "124",
                         style: TextStyle(
                             fontSize: 50,
                             color: Colors.black87,
                             fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   ),

                   Container(
                     margin: EdgeInsets.only(top: 1,left: 30),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                         "Km Left",
                         style: TextStyle(
                             fontSize: 16,
                             color: Colors.grey.shade500,
                             fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   ),
                   Container(
                     width: 120,
                     height: 120,
                     margin: EdgeInsets.only(top: 10,left: 20),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(16),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.2),
                           spreadRadius: 2,
                           blurRadius: 8,
                           offset: Offset(0, 4),
                         ),
                       ],
                     ),
                     padding: EdgeInsets.all(16),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         // Circular Progress Section
                         Expanded(
                           flex: 3,
                           child: Stack(
                             alignment: Alignment.center,
                             children: [
                               // Background Circle
                               Container(
                                 width: 70,
                                 height: 70,
                                 child: CircularProgressIndicator(
                                   value: 1.0,
                                   strokeWidth: 6,
                                   backgroundColor: Colors.grey[300],
                                   valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]!),
                                 ),
                               ),
                               // Progress Circle
                               Container(
                                 width: 70,
                                 height: 70,
                                 child: CircularProgressIndicator(
                                   value: 0.76, // Change this for different percentages
                                   strokeWidth: 6,
                                   backgroundColor: Colors.transparent,
                                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10D9C4)),
                                 ),
                               ),
                               // Center Number
                               Text(
                                 '76', // Change this number too
                                 style: TextStyle(
                                   fontSize: 24,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black87,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         // Bottom Row with % and battery
                         Expanded(
                           flex: 1,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('%', style: TextStyle(fontSize: 14, color: Colors.grey)),
                               Container(
                                 width: 20,
                                 height: 12,
                                 decoration: BoxDecoration(
                                   border: Border.all(color: Colors.grey[600]!, width: 1.5),
                                   borderRadius: BorderRadius.circular(2),
                                 ),
                                 child: Stack(
                                   children: [
                                     Positioned(
                                       right: -3,
                                       top: 3,
                                       child: Container(
                                         width: 2,
                                         height: 6,
                                         decoration: BoxDecoration(
                                           color: Colors.grey[600],
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(1),
                                             bottomRight: Radius.circular(1),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),


                 ],),

              



             ],)


          ],
        ),
      ),


    );
  }
}
