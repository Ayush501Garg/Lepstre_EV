import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/app_sizing.dart';

import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../widgets/custom_btn.dart';
import '../../widgets/custom_slider.dart';
import '../data/data.dart';

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search scooters...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.greyColor,
                      ),
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
            ),

            verticalSpacing(25),
            CustomImageSlider(
              imagePaths: [banner2, banner1],
              height: screenHeight(context) * 0.22,
            ),

            verticalSpacing(15),
            buildVehicleListSection(context),
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

  /// --- SECTION: New Releases with Stylish Card ---
  Widget buildNewReleasesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader(context, title: "New Arrivals"),
        SizedBox(
          height: screenHeight(context) * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vehicleList.length,
            itemBuilder: (context, index) {
              final item = vehicleList[index];
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 500 + index * 100),
                tween: Tween(begin: 0.8, end: 1),
                curve: Curves.easeOutBack,
                builder: (_, scale, child) =>
                    Transform.scale(scale: scale, child: child),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: BiikeDetailsScreen(
                          image: item['image']!,
                          title: item['name']!,
                          price:
                              item['Range']!, // Or item['price'] if you have that
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth(context) * 0.55,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: appGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            item['image']!,
                            height: screenHeight(context) * 0.3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          bottom: 16,
                          right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: whiteText20600.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              verticalSpacing(4),
                              Text(
                                item['Range']!,
                                style: whiteText14600.copyWith(
                                  color: AppColors.lightCreame,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "New",
                              style: whiteText12600.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildProductDetailsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black87,
        gradient: appGradient,
        boxShadow: const [
          BoxShadow(color: AppColors.lightCreame, blurRadius: 2),
        ],
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

  Set<String> favoriteVehicles = {}; // Add this in your State class

  Widget buildVehicleListSection(BuildContext context) {
    return SizedBox(
      height: 330, // approx 0.46 * 690 (design height)
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: vehicleList.length,
        separatorBuilder: (_, __) => SizedBox(width: 15),
        itemBuilder: (context, index) {
          final vehicle = vehicleList[index];
          final isFavorite = favoriteVehicles.contains(vehicle['name']);

          return Container(
            width: 240, // 0.65 * 360 (design width)
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primaryLightColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        vehicle['image'],
                        width: double.infinity,
                        height: 172, // approx 0.25 * 690
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isFavorite) {
                                favoriteVehicles.remove(vehicle['name']);
                              } else {
                                favoriteVehicles.add(vehicle['name']);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                              isFavorite ? Colors.red : Colors.grey[700],
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle['name'],
                        style: blackText16600.copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.battery_charging_full,
                              size: 16, color: Colors.teal),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "${vehicle['Battery Type']}",
                              style: greyText12600.copyWith(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.route,
                              size: 16, color: Colors.indigo),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "${vehicle['Range']}",
                              style: greyText12600.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.eco, size: 16, color: Colors.green),
                          SizedBox(width: 6),
                          Text("${vehicle['Emission']}",
                              style:
                              greyText12600.copyWith(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CustomPageRoute(
                                child: BiikeDetailsScreen(
                                  image: vehicle['image']!,
                                  title: vehicle['name']!,
                                  price: vehicle['Range']!,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            elevation: 2,
                          ),
                          child: Text("View Details",
                              style:
                              whiteText12600.copyWith(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FilteredCategoriesScreen extends StatefulWidget {
  const FilteredCategoriesScreen({super.key});

  @override
  State<FilteredCategoriesScreen> createState() =>
      _FilteredCategoriesScreenState();
}

class _FilteredCategoriesScreenState extends State<FilteredCategoriesScreen> {
  String selectedBattery = '';
  String selectedEmission = '';
  String selectedRange = '';

  List<Map<String, String>> filteredVehicles = [];

  final List<Map<String, String>> vehicleList = [
    {
      "name": "TANK",
      "Battery Type": "48V20AH/72V40AH Lithium",
      "Range": "50km/110km",
      "Emission": "0.7g/km",
      "image": tank_darkgreen,
    },
    {
      "name": "S92 PRO",
      "Battery Type": "72V35Ah Lead Acid",
      "Range": "90KM@ 30km",
      "Emission": "0.7g/km",
      "image": S92PRO_white,
    },
    {
      "name": "SPORT F1 PRO",
      "Battery Type": "72V35Ah Lead Acid",
      "Range": "90KM@ 30km",
      "Emission": "0.7g/km",
      "image": voltiger_white,
    },
    {
      "name": "YOUPAO",
      "Battery Type": "48V20AH/72V40AH Lithium",
      "Range": "50km/110km",
      "Emission": "0.7g/km",
      "image": youpao_2_blue,
    },
    {
      "name": "F55",
      "Battery Type": "72V35Ah Lead Acid",
      "Range": "90KM@ 30km",
      "Emission": "0.7g/km",
      "image": T155__2_grey,
    },
    {
      "name": "ZY",
      "Battery Type": "72V35Ah Lead Acid",
      "Range": "90KM@ 30km",
      "Emission": "0.7g/km",
      "image": tiger,
    },
    {
      "name": "A9",
      "Battery Type": "48V20AH/72V40AH Lithium",
      "Range": "50km/110km",
      "Emission": "0.7g/km",
      "image": a9,
    },
    {
      "name": "ROBIN D",
      "Battery Type": "48V/20AH Lead Acid",
      "Range": "40 KM - 45KM",
      "Emission": "0.7g/km",
      "image": robin_d_darkblue,
    },
    {
      "name": "SUMMER/EEC",
      "Battery Type": "72V40Ah Lithium Acid",
      "Range": "55-100 KM",
      "Emission": "0.7g/km",
      "image": summer_light_blue,
    },
    {
      "name": "F85",
      "Battery Type": "72V20Ah Lead Acid",
      "Range": "60-90 KM@ 35Km/h",
      "Emission": "0.7g/km",
      "image": F85_white,
    },
    {
      "name": "Outstanding",
      "Battery Type": "72V30Ah Lithium Battery",
      "Range": "70 KM",
      "Emission": "0.7g/km",
      "image": outstanding,
    },
    {
      "name": "KB",
      "Battery Type": "72V32Ah Lead Acid",
      "Range": "90KM@ 30km/h",
      "Emission": "0.7g/km",
      "image": KB_grey,
    },
  ];

  @override
  void initState() {
    super.initState();
    filteredVehicles = List.from(vehicleList);
  }

  void filterVehiclesAdvanced() {
    setState(() {
      filteredVehicles = vehicleList.where((vehicle) {
        final batteryMatch =
            selectedBattery.isEmpty ||
            vehicle['Battery Type'] == selectedBattery;
        final emissionMatch =
            selectedEmission.isEmpty || vehicle['Emission'] == selectedEmission;
        final rangeMatch =
            selectedRange.isEmpty || vehicle['Range'] == selectedRange;
        return batteryMatch && emissionMatch && rangeMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final batteryTypes = vehicleList
        .map((v) => v['Battery Type']!)
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList();

    final emissions = vehicleList
        .map((v) => v['Emission']!)
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList();

    final ranges = vehicleList
        .map((v) => v['Range']!)
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Filter by Battery Type"),
          _buildFilterChips(batteryTypes, selectedBattery, (val) {
            selectedBattery = val;
            filterVehiclesAdvanced();
          }),
          const SizedBox(height: 12),

          _sectionTitle("Filter by Emission"),
          _buildFilterChips(emissions, selectedEmission, (val) {
            selectedEmission = val;
            filterVehiclesAdvanced();
          }),
          const SizedBox(height: 12),

          _sectionTitle("Filter by Range"),
          _buildFilterChips(ranges, selectedRange, (val) {
            selectedRange = val;
            filterVehiclesAdvanced();
          }),
          const SizedBox(height: 30),

          filteredVehicles.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "No vehicles match your filters.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredVehicles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredVehicles[index];
                    return _buildGlassCard(context, item);
                  },
                ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
      ),
    );
  }

  Widget _buildFilterChips(
    List<String> values,
    String selectedValue,
    void Function(String) onChanged,
  ) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        itemBuilder: (context, index) {
          final val = values[index];
          final isSelected = selectedValue == val;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => onChanged(isSelected ? '' : val),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: isSelected ? appGradient : null,
                  color: isSelected
                      ? null
                      : AppColors.lightCreame.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : AppColors.primaryColor.withOpacity(0.3),
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  val,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGlassCard(BuildContext context, Map<String, String> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(
            child: BiikeDetailsScreen(
              image: item['image']!,
              title: item['name']!,
              price: item['Range']!, // Or item['price'] if you have that
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.whiteColor.withOpacity(0.25),
                  AppColors.whiteColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: AppColors.whiteColor.withOpacity(0.15),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.07),
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    item['image']!,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['Battery Type']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        item['Emission']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        item['Range']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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