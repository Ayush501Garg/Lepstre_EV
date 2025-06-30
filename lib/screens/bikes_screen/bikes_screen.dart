import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';

import 'package:lepster/core/constants/text_style.dart';

import '../../widgets/custom_slider.dart';
import '../../data/data.dart';
import '../home_screen/widgets/widget.dart';
import 'widgets/filter_product.dart';
import 'widgets/main_product_sard.dart';
import 'widgets/search_sort.dart';
import 'widgets/vehicle_list_section.dart';

class BikesScreen extends StatefulWidget {
  const BikesScreen({super.key});

  @override
  State<BikesScreen> createState() => _BikesScreenState();
}

class _BikesScreenState extends State<BikesScreen> {
  String selectedCategory = 'E-Scooter';
  @override
  void initState() {
    super.initState();
    filterVehiclesByCategory(); // Initialize with default category
  }

  var filteredVehicles;

  void filterVehiclesByCategory() {
    filteredVehicles = vehicleList
        .where(
          (item) =>
              item['category']?.toLowerCase() == selectedCategory.toLowerCase(),
        ) // match lowercase
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: horizontalPadding(context: context, padding: 15),
          children: [
            verticalSpacing(10),
            searchWithShort(),

            verticalSpacing(25),

            CustomImageSlider(imagePaths: sliderImages),
            verticalSpacing(15),
            VehicleListSection(vehicleList: vehicleList),
            verticalSpacing(15),
            sectionHeader(context, title: "Lepster Pro Detail"),
            buildProductDetailsCard(context),
            verticalSpacing(15),

            verticalSpacing(15),
            FilteredCategoriesScreen(),
            verticalSpacing(15),

            buildNewReleasesSection(context),
            // buildCategoryGrid(context),
            verticalSpacing(30),
          ],
        ),
      ),
    );
  }

  Set<String> favoriteVehicles = {}; // Add this in your State class
}

Widget sectionHeader(BuildContext context, {required String title}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, top: 10),
    child: Text(title, style: blackText18600),
  );
}




// full updated file below

// Add this new section to display all vehicles in a grid format as categories
// Widget buildCategoryGrid(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Text("Explore All", style: blackText18600),
//       ),
//       MasonryGridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         itemCount: vehicleList.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           final vehicle = vehicleList[index];
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 CustomPageRoute(
//                   child: BiikeDetailsScreen(
//                     image: vehicle['image'],
//                     title: vehicle['name'],
//                     price: vehicle['Range'],
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 gradient: appGradient,
//                 boxShadow: const [
//                   BoxShadow(color: AppColors.lightCreame, blurRadius: 4),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(16),
//                     ),
//                     child: Image.asset(
//                       vehicle['image'],
//                       height: screenHeight(context) * 0.2,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(vehicle['name'], style: whiteText14600),
//                         verticalSpacing(2),
//                         Text(
//                           vehicle['Battery Type'],
//                           style: whiteText12600,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     ],
//   );
// }