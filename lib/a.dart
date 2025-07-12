import 'package:flutter/material.dart';
import 'package:lepster/core/constants/image_path.dart';

import 'core/constants/text_style.dart';
import 'screens/map_screen/single_map_screen.dart';

class GoRideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoRide UI',
      home: GoRideHomePage(),
    );
  }
}

class GoRideHomePage extends StatelessWidget {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map image placeholder
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(map, fit: BoxFit.cover, width: double.infinity),
          ),

          // Top search box
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                searchBox(_pickupController, "Enter pickup location"),
                SizedBox(height: 10),
                searchBox(_dropController, "Enter drop location"),
              ],
            ),
          ),

          // Ride options
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  rideOption(
                    "GoRide Car",
                    "\$10.00",
                    "3-5 mins",
                    "4 passengers",
                  ),
                  SizedBox(height: 10),
                  rideOption(
                    "GoRide Car XL",
                    "\$12.00",
                    "4-6 mins",
                    "6 passengers",
                  ),
                  SizedBox(height: 10),
                  rideOption(
                    "GoRide Car Plus",
                    "\$13.20",
                    "4-5 mins",
                    "4 passengers",
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "GoRide Wallet",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promos / Vouchers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("EOW25", style: TextStyle(color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleMapScreen(),
                          ),
                        );
                      },
                      child: Text("Book GoRide Car", style: whiteText14600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.location_on, color: Colors.green),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget rideOption(String title, String price, String time, String capacity) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.directions_car, size: 30, color: Colors.green),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "$time · $capacity",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
