import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/screens/bikes_screen/biike_details_screen.dart';
import 'package:lepster/widgets/custom_page_route.dart';

class BikesScreen extends StatefulWidget {
  @override
  State<BikesScreen> createState() => _BikesScreenState();
}

class _BikesScreenState extends State<BikesScreen> {
  final List<Map<String, String>> sliderData = [
    {
      'image': ev1,
      'title': 'Lepster Ultra X',
      'subtitle': 'Next-gen electric mobility',
    },
    {
      'image': ev1,
      'title': 'Ride Smart',
      'subtitle': 'Eco-friendly urban travel',
    },
  ];

  final List<Map<String, String>> newReleases = [
    {'image': ev3, 'title': 'Voi unveils scooter', 'price': '\$1590'},
    {'image': ev4, 'title': 'M300 Electric scooter', 'price': '\$1399'},
    {'image': ev3, 'title': 'M300 Electric scooter', 'price': '\$1399'},
    {'image': ev4, 'title': 'M300 Electric scooter', 'price': '\$1399'},
  ];

  final List<String> categories = [
    'E-Scooter',
    'Electric Bikes',
    'For Kids',
    'Off-road',
    'Accessories',
  ];

  String selectedCategory = 'E-Scooter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: horizontalPadding(context: context, padding: 16),
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
                    color: AppColors.darkGreenColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.tune, color: AppColors.whiteColor),
                ),
              ],
            ),

            verticalSpacing(24),

            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight(context) * 0.2,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items: sliderData.map((data) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.9),
                        AppColors.darkGreenColor.withOpacity(0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data['title']!, style: whiteText20600),
                            verticalSpacing(4),
                            Text(data['subtitle']!, style: whiteText16600),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          data['image']!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            verticalSpacing(15),

            sectionHeader(context, title: "New Releases"),
            SizedBox(
              height: screenHeight(context) * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newReleases.length,
                itemBuilder: (context, index) {
                  return newReleaseSectionCard(context, newReleases[index]);
                },
              ),
            ),

            verticalSpacing(20),

            sectionHeader(context, title: "Categories"),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: categories.map((category) {
                final bool isSelected = selectedCategory == category;
                return ChoiceChip(
                  label: Text(
                    category,
                    style: whiteText16600.copyWith(
                      color: isSelected
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => selectedCategory = category);
                  },
                  selectedColor: AppColors.darkGreenColor,
                  backgroundColor: AppColors.lightCreame,
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }).toList(),
            ),

            verticalSpacing(16),
            SizedBox(
              height: screenHeight(context) * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newReleases.length,
                itemBuilder: (context, index) {
                  return newReleaseSectionCard(
                    context,
                    newReleases[(index + selectedCategory.length) %
                        newReleases.length],
                  );
                },
              ),
            ),

            verticalSpacing(30),

            sectionHeader(context, title: "Lepster Pro Detail"),

            buildProductDetailsCard(context),
            verticalSpacing(20),
            sectionHeader(context, title: "Our Latest Products"),

            buildGalleryGrid(allProducts, context),
            verticalSpacing(20),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Text(title, style: blackText18600),
    );
  }

  Widget newReleaseSectionCard(BuildContext context, Map<String, String> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(
            child: BiikeDetailsScreen(
              image: item['image']!,
              title: item['title']!,
              price: item['price']!,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth(context) * 0.42,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.darkGreenColor.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGreenColor1.withOpacity(0.4),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                item['image']!,
                height: screenHeight(context) * 0.15,
                width: screenWidth(context),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(item['title']!, style: whiteText16600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(item['price']!, style: whiteText16600),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetailsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.9),
            AppColors.darkGreenColor.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryLightColor.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ev1, fit: BoxFit.cover, width: double.infinity),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                foregroundColor: AppColors.darkGreenColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildGalleryGrid(
  List<Map<String, String>> products,
  BuildContext context,
) {
  return MasonryGridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    itemCount: products.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      final item = products[index];

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            CustomPageRoute(
              child: BiikeDetailsScreen(
                image: item['image']!,
                title: item['title']!,
                price: item['price']!,
              ),
            ),
          );
        },
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 500 + (index * 80)),
          tween: Tween(begin: 0.8, end: 1.0),
          curve: Curves.easeOutBack,
          builder: (context, scale, child) {
            return Transform.scale(scale: scale, child: child);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: (index % 3 == 0)
                  ? 1
                  : 0.75, // Dynamically vary tile height
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(item['image']!, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: whiteText16600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpacing(2),
                        Text(item['price']!, style: whiteText14600),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

final List<Map<String, String>> allProducts = [
  {
    'image': ev3,
    'title': 'Voi unveils scooter',
    'price': '\$1590',
    'category': 'E-Scooter',
  },
  {
    'image': ev4,
    'title': 'M300 Electric scooter',
    'price': '\$1399',
    'category': 'Electric Bikes',
  },
  {
    'image': ev3,
    'title': 'Kidz Zip Scooter',
    'price': '\$790',
    'category': 'For Kids',
  },
  {
    'image': ev4,
    'title': 'Beast Off-roader',
    'price': '\$2099',
    'category': 'Off-road',
  },
  {
    'image': ev1,
    'title': 'Helmet + Gloves',
    'price': '\$299',
    'category': 'Accessories',
  },
  {
    'image': ev2,
    'title': 'Smart Lock',
    'price': '\$179',
    'category': 'Accessories',
  },
];
