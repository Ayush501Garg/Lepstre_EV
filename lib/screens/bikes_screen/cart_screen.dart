import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';

import '../../widgets/custom_back_buttom.dart';
import '../../widgets/dialog.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': ev1,
      'title': 'Mi Electric Scooter 3',
      'price': 1590.0,
      'quantity': 1,
    },
    {
      'image': ev3,
      'title': 'Atphfety scooter helmet',
      'price': 60.0,
      'quantity': 1,
    },
    {
      'image': ev4,
      'title': 'Epessa scooter storage bag',
      'price': 60.0,
      'quantity': 1,
    },
  ];

  double get subtotal => cartItems.fold(
    0,
    (sum, item) => sum + (item['price'] * item['quantity']),
  );

  double shipping = 10.0;

  void increaseQty(int index) {
    setState(() => cartItems[index]['quantity']++);
  }

  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: symmetricPadding(
            context: context,
            horizontalPercent: 15,
            verticalPercent: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  customBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  horizontalSpacing(20),
                  Text("My cart", style: blackText18600),
                ],
              ),
              verticalSpacing(20),
              Expanded(
                child: ListView.separated(
                  itemCount: cartItems.length,
                  separatorBuilder: (_, __) =>
                      Divider(color: AppColors.darkGreenColor),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: verticalPadding(context: context, padding: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item['image'],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          horizontalSpacing(12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'], style: blackText16600),
                                verticalSpacing(6),
                                Text(
                                  "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                                  style: greyText14600,
                                ),

                                verticalSpacing(8),
                                Row(
                                  children: [
                                    _qtyBtn(
                                      Icons.remove,
                                      () => decreaseQty(index),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        item['quantity'].toString(),
                                        style: blackText16600,
                                      ),
                                    ),
                                    _qtyBtn(
                                      Icons.add,
                                      () => increaseQty(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Divider(height: 32, color: AppColors.greyColor),
              _infoRow("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
              _infoRow("Shipping cost", "+\$${shipping.toStringAsFixed(2)}"),
              Divider(height: 32, color: AppColors.greyColor),
              _infoRow(
                "Total",
                "\$${(subtotal + shipping).toStringAsFixed(2)}",
                isTotal: true,
              ),
              verticalSpacing(16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showCheckoutSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkGreenColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text("Checkout", style: whiteText16600),
                ),
              ),
              verticalSpacing(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.darkGreenColor,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _infoRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal ? blackText18600 : greyText14600.copyWith(),
          ),
          Text(
            value,
            style: isTotal ? blackText18600 : blackText16600.copyWith(),
          ),
        ],
      ),
    );
  }
}
