import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/app_sizing.dart';

import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../../widgets/custom_btn.dart';

Widget searchWithShort() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search scooters...',
            prefixIcon: Icon(Icons.search, color: AppColors.greyColor),
            filled: true,
            fillColor: AppColors.lightCreame,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      horizontalSpacing(12),
      Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(Icons.tune, color: AppColors.whiteColor),
      ),
    ],
  );
}
