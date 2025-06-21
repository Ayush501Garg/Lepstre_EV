import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../widgets/custom_back_buttom.dart';
import 'cart_screen.dart';

class BiikeDetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: image,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  child: Image.asset(
                    image,
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
          verticalSpacing(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: blackText18600),
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
                Text(price, style: blackText20600),
                verticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _specTile("Top Speed", "25km/h", Icons.speed),
                    _specTile("Charge", "5 hrs", Icons.battery_charging_full),
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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                    onPressed: () {},
                    child: const Text("Buy it now"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
