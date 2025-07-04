import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/image_path.dart';

import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';


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
                    childAspectRatio: 0.65,
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
