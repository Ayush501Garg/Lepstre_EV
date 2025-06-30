import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/data/data.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_page_route.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Create actual vehicle objects using name match
    final favoriteVehicles = vehicleList
        .where((v) => globalFavoriteVehicleNames.contains(v['name']))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  customBackButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Text("Your Favorites", style: blackText20600),
                ],
              ),
            ),
            Expanded(
              child: favoriteVehicles.isEmpty
                  ? _buildEmptyView(context)
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      itemCount: favoriteVehicles.length,
                      itemBuilder: (context, index) {
                        final vehicle = favoriteVehicles[index]; // ✅ No error

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CustomPageRoute(
                                child: BiikeDetailsScreen(
                                  image: vehicle['image'] ?? "",
                                  title: vehicle['name'] ?? "",
                                  price: vehicle['range'] ?? "",
                                ),
                              ),
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOutCubic,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    vehicle['image'] ?? "",
                                    height: screenHeight(context) * 0.15,
                                    width: screenWidth(context) * 0.35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vehicle['name'] ?? "",
                                          style: blackText16600,
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.route,
                                              size: 16,
                                              color: Colors.indigo,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              vehicle['range'] ?? "",
                                              style: greyText12600,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.bolt,
                                              size: 16,
                                              color: Colors.teal,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              "Electric",
                                              style: greyText12600,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(youpao_2_blue, height: screenHeight(context) * 0.3),
            const SizedBox(height: 20),
            Text(
              "No Favorites Yet!",
              style: blackText18600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Explore EVs and add your favorite bikes here for quick access.",
              style: greyText14600,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
