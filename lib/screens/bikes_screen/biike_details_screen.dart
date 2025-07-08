import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/core/utils/helper_function.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../widgets/custom_back_buttom.dart';
import '../new_screen.dart';
import 'cart_screen.dart';

class BiikeDetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const BiikeDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<BiikeDetailsScreen> createState() => _BiikeDetailsScreenState();
}

class _BiikeDetailsScreenState extends State<BiikeDetailsScreen> {
  int selectedDurationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.lightCreame,
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.image,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                        child: Image.asset(
                          widget.image,
                          width: double.infinity,
                          height: screenHeight(context) * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customBackButton(
                              icon: Icons.arrow_back_ios_new,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            customBackButton(
                              icon: Icons.favorite_border,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(16),
              ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: blackText18600),
                      verticalSpacing(6),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          horizontalSpacing(4),
                          Text("4.8", style: greyText14600),
                          horizontalSpacing(10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightCreame,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text("360° View", style: greenText14600),
                          ),
                        ],
                      ),
                      verticalSpacing(16),
                      Text("MRP:", style: greyText14600),
                      Text(widget.price, style: blackText20600),
                      verticalSpacing(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _specTile("Top Speed", "25km/h", Icons.speed),
                          _specTile(
                            "Charge",
                            "5 hrs",
                            Icons.battery_charging_full,
                          ),
                        ],
                      ),
                      verticalSpacing(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _specTile("Power", "2kw", Icons.bolt),
                          _specTile("Max Load", "120kg", Icons.monitor_weight),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                    child: Text(
                      'Vehicle Features',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => EV3DModelScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.lightCreame,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featureRow(
                            Icons.bluetooth,
                            'Bluetooth & WIFI',
                            blackText14600,
                          ),
                          SizedBox(height: 12),
                          featureRow(
                            Icons.explore,
                            'GPS & compass',
                            blackText14600,
                          ),
                          SizedBox(height: 12),
                          featureRow(
                            Icons.security,
                            'Safety standard',
                            blackText14600,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 25, bottom: 10),
                    child: Text(
                      'Duration',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Per-Day Rent Card
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDurationIndex = 0;
                            });
                          },
                          child: Container(
                            height: 140,
                            // ✅ Fix height for equal size
                            margin: EdgeInsets.only(left: 16, right: 8),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: selectedDurationIndex == 0
                                  ? Colors.teal.withOpacity(0.1)
                                  : AppColors.lightCreame,

                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.calendar_today, size: 18),
                                Text(
                                  'Per-Day Rent',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹180',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Best for business\nappointments',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Weekly Rent Card
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDurationIndex = 1;
                            });
                          },
                          child: Container(
                            height: 140,
                            // ✅ Same height as left card
                            margin: EdgeInsets.only(right: 16, left: 8),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: selectedDurationIndex == 1
                                  ? Colors.teal.withOpacity(0.1)
                                  : AppColors.lightCreame,

                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.calendar_month, size: 18),
                                Text(
                                  'Weekly Rent',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹1080',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Best for travel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightCreame,
                          foregroundColor: AppColors.darkGreenColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text("Add to cart"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(child: CartScreen()),
                          );
                        },
                      ),
                    ),
                    horizontalSpacing(12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreenColor,
                          foregroundColor: AppColors.whiteColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          makePhoneCall();
                        },
                        child: const Text("Buy it now"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featureRow(IconData icon, String label, TextStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 22, color: AppColors.primaryColor),
        SizedBox(width: 12),
        Expanded(child: Text(label, style: style)),
      ],
    );
  }

  Widget _specTile(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.lightCreame,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 20),
            horizontalSpacing(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: blackText16600),
                Text(title, style: greyText12400),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
