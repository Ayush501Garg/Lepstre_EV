import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';

import '../../../widgets/custom_toast.dart';
import '../../../data/data.dart';

class VehicleListSection extends StatefulWidget {
  final List vehicleList;

  const VehicleListSection({super.key, required this.vehicleList});

  @override
  State<VehicleListSection> createState() => _VehicleListSectionState();
}

class _VehicleListSectionState extends State<VehicleListSection> {
  // void toggleFavorite(String name) {
  //   final isRemoving = globalFavoriteVehicleNames.contains(name);
  //   setState(() {
  //     if (isRemoving) {
  //       globalFavoriteVehicleNames.remove(name);
  //     } else {
  //       globalFavoriteVehicleNames.add(name);
  //     }
  //   });
  //
  //   showCustomToast(
  //     context: context,
  //     message: isRemoving
  //         ? '$name removed from favorites'
  //         : '$name added to favorites',
  //     type: isRemoving ? ToastType.warning : ToastType.success,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.47,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.vehicleList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final vehicle = widget.vehicleList[index];
          final isFavorite = globalFavoriteVehicleNames.contains(
            vehicle['name'],
          );

          return Container(
            width: screenWidth(context) * 0.65,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                        vehicle['image']!,
                        width: screenWidth(context),
                        height: screenHeight(context) * 0.25,
                        fit: BoxFit.fitWidth,
                      ),
                      // Positioned(
                      //   top: 5,
                      //   right: 10,
                      //   child: GestureDetector(
                      //     onTap: () => toggleFavorite(vehicle['name']!),
                      //     child: Container(
                      //       padding: const EdgeInsets.all(8),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         shape: BoxShape.circle,
                      //         boxShadow: [
                      //           BoxShadow(color: Colors.black26, blurRadius: 2),
                      //         ],
                      //       ),
                      //       child: Icon(
                      //         isFavorite
                      //             ? Icons.bookmark
                      //             : Icons.bookmark_outline,
                      //         color: AppColors.lightGreenColor,
                      //         size: 25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle['name']!,
                        style: blackText16600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.battery_charging_full,
                            size: 16,
                            color: Colors.teal,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              vehicle['Battery Type']!,
                              style: greyText12600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.route,
                            size: 16,
                            color: Colors.indigo,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              vehicle['Range']!,
                              style: greyText12600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.eco, size: 16, color: Colors.green),
                          const SizedBox(width: 6),
                          Text(vehicle['Emission']!, style: greyText12600),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: screenWidth(context),
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
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            elevation: 2,
                          ),
                          child: Text("View Details", style: whiteText12600),
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
