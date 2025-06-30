import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/app_sizing.dart';

import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../../widgets/custom_btn.dart';

Widget buildProductDetailsCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.black87,
      gradient: appGradient,
      boxShadow: const [BoxShadow(color: AppColors.lightCreame, blurRadius: 2)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(youpao_2_blue, fit: BoxFit.cover, width: double.infinity),
        verticalSpacing(12),
        Text('MI Electric Scooter Pro2', style: whiteText20600),
        verticalSpacing(4),
        Text('\$1350', style: whiteText20600),
        verticalSpacing(10),
        Text('Specifications:', style: whiteText14600),
        verticalSpacing(4),
        Text('• Max speed: 25 km/h', style: whiteText16600),
        Text('• Range: 45 km', style: whiteText16600),
        Text('• Charging: 8 hours', style: whiteText16600),
        Text('• Foldable: Yes', style: whiteText16600),
        verticalSpacing(16),
        CustomButton(
          title: 'Buy Now',
          onPressed: () {
            Navigator.push(
              context,
              CustomPageRoute(
                child: BiikeDetailsScreen(
                  image: youpao_2_blue,
                  title: "Youpao2 blue ",
                  price: "150", // Or item['price'] if you have that
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
