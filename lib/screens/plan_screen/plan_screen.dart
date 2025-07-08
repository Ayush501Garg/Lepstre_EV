// import 'package:flutter/material.dart';
//
// import '../../core/constants/app_color.dart';
// import '../../widgets/custom_plan_card.dart';
//
// class PlanScreen extends StatefulWidget {
//   const PlanScreen({super.key});
//
//   @override
//   State<PlanScreen> createState() => _PlanScreenState();
// }
//
// class _PlanScreenState extends State<PlanScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.backgroundColor,
//       body:SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               // ------------------- Buy Plans -------------------
//               const Text("Buy Plans", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 240,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children:  [
//                     PlanCard(
//                       icon: Icons.payments,
//                       title: "One-Time Payment",
//                       price: "₹74,999",
//                       subtitle: "Full payment and instant ownership of the scooter.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.schedule,
//                       title: "EMI Option",
//                       price: "₹3,500/month",
//                       subtitle: "Pay in easy monthly installments for 24 months.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.swap_horiz,
//                       title: "Exchange Offer",
//                       price: "Save ₹5,000",
//                       subtitle: "Exchange your old scooter and get bonus discount.",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // ------------------- Rent Plans -------------------
//               const Text("Rent Plans", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 240,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children:  [
//                     PlanCard(
//                       icon: Icons.calendar_view_week,
//                       title: "Weekly Plan",
//                       price: "₹999/week",
//                       subtitle: "Best for short-term delivery and travel use.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.calendar_month,
//                       title: "Monthly Plan",
//                       price: "₹3499/month",
//                       subtitle: "Long-term affordable package with full support.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.access_time_filled,
//                       title: "Weekend Plan",
//                       price: "₹499/2 days",
//                       subtitle: "Ride free on Saturday and Sunday anytime.",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // ------------------- Lease Plans -------------------
//               const Text("Lease Plans", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 240,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children:  [
//                     PlanCard(
//                       icon: Icons.timer,
//                       title: "6-Month Lease",
//                       price: "₹2,999/month",
//                       subtitle: "Save more with mid-term scooter lease for business.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.timelapse,
//                       title: "12-Month Lease",
//                       price: "₹2,499/month",
//                       subtitle: "Lowest price for long-term commitment plans.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.business_center,
//                       title: "Corporate Lease",
//                       price: "Bulk Deal",
//                       subtitle: "Custom pricing for fleets and enterprise needs.",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // ------------------- Custom Plans -------------------
//               const Text("Custom Plans", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 12),
//               SizedBox(
//                 height: 240,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children:  [
//                     PlanCard(
//                       icon: Icons.settings,
//                       title: "IoT Add-On",
//                       price: "₹999",
//                       subtitle: "Real-time tracking and smart analytics on your ride.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.battery_charging_full,
//                       title: "Charging Setup",
//                       price: "₹1,999",
//                       subtitle: "Get your own charging station at home/office.",
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 12),
//                     PlanCard(
//                       icon: Icons.support_agent,
//                       title: "Premium Support",
//                       price: "₹499/month",
//                       subtitle: "24x7 customer support with priority servicing.",
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//
//     );
//   }
// }



import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/constants/text_style.dart';
import '../../widgets/custom_back_buttom.dart';
import '../../widgets/custom_plan_card.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {

  final ScrollController _scrollController = ScrollController();
  double _currentPage = 0;
  String selectedCategory = "All";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() {}); // Scroll hone par redraw
    });

  }

  final List<String> categories = [
    "All",
    "Buy Plans",
    "Rent Plans",
    "Lease Plans",
    "Custom Plans",
  ];

  final List<Map<String, String>> plans = [
    {
      "title": "One-Time Payment",
      "price": "₹74,999",
      "subtitle": "Full payment and instant ownership of the scooter.",
      "category": "Buy Plans",
    },
    {
      "title": "EMI Option",
      "price": "₹3,500/month",
      "subtitle": "Pay in easy monthly installments for 24 months.",
      "category": "Buy Plans",
    },
    {
      "title": "Exchange Offer",
      "price": "Save ₹5,000",
      "subtitle": "Exchange your old scooter and get bonus discount.",
      "category": "Buy Plans",
    },
    {
      "title": "Weekly Plan",
      "price": "₹999/week",
      "subtitle": "Best for short-term delivery and travel use.",
      "category": "Rent Plans",
    },
    {
      "title": "Monthly Plan",
      "price": "₹3499/month",
      "subtitle": "Long-term affordable package with full support.",
      "category": "Rent Plans",
    },
    {
      "title": "Weekend Plan",
      "price": "₹499/2 days",
      "subtitle": "Ride free on Saturday and Sunday anytime.",
      "category": "Rent Plans",
    },
    {
      "title": "6-Month Lease",
      "price": "₹2,999/month",
      "subtitle": "Save more with mid-term scooter lease for business.",
      "category": "Lease Plans",
    },
    {
      "title": "12-Month Lease",
      "price": "₹2,499/month",
      "subtitle": "Lowest price for long-term commitment plans.",
      "category": "Lease Plans",
    },
    {
      "title": "Corporate Lease",
      "price": "Bulk Deal",
      "subtitle": "Custom pricing for fleets and enterprise needs.",
      "category": "Lease Plans",
    },
    {
      "title": "IoT Add-On",
      "price": "₹999",
      "subtitle": "Real-time tracking and smart analytics on your ride.",
      "category": "Custom Plans",
    },
    {
      "title": "Charging Setup",
      "price": "₹1,999",
      "subtitle": "Get your own charging station at home/office.",
      "category": "Custom Plans",
    },
    {
      "title": "Premium Support",
      "price": "₹499/month",
      "subtitle": "24x7 customer support with priority servicing.",
      "category": "Custom Plans",
    },
  ];

  final List<Map<String, dynamic>> plan = [
    {
      "title": "Starter Plan",
      "price": "₹999",
      "subtitle": "Perfect for individuals starting out.\nIncludes basic features and 24/7 support.",
      "icon": Icons.lightbulb,
    },
    {
      "title": "Professional",
      "price": "₹2499",
      "subtitle": "Ideal for professionals and small teams.\nIncludes extended features and priority support.",
      "icon": Icons.work,
    },
    {
      "title": "Business",
      "price": "₹4999",
      "subtitle": "Best for growing businesses.\nIncludes all features, analytics & integrations.",
      "icon": Icons.business_center,
    },
    {
      "title": "Enterprise",
      "price": "₹9999",
      "subtitle": "Custom solution for large organizations.\nDedicated manager and SLA guaranteed uptime.",
      "icon": Icons.apartment,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredPlans = selectedCategory == "All"
        ? plans
        : plans.where((plan) => plan['category'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                // ------------------- Category Tabs -------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: BackBtnWithText(
                    context: context,
                    text: "View Our Plans",
                  ),
                ),
                verticalSpacing(20),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        child: Center(
                          // ✅ Center each chip vertically
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                verticalSpacing(10),
                SizedBox(
                  height: screenHeight(context) * 0.32,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: screenHeight(context) * 0.27,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredPlans.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final plan = filteredPlans[index];
                            return PlanCard(
                              icon: Icons.payment, // Optional, not shown
                              title: plan['title'] ?? '',
                              price: plan['price'] ?? '',
                              subtitle: plan['subtitle'] ?? '',
                              onTap: () {


                                // Handle tap
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),



                // ------------------- Plan Cards -------------------

                Text(
                  "Current Plan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                              verticalSpacing(20),

                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGreenColor.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "📡 Smart Feature Add-On",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.settings_remote,
                                          color: AppColors.primaryColor,
                                          size: 32,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "IoT Add-On",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "₹999 • Real-time tracking & analytics.",
                                                style: TextStyle(
                                                  color: AppColors.greyColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text("Add to Plan", style: whiteText14600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              verticalSpacing(10),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppColors.primaryColor.withOpacity(0.3),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "🔥 Most Beneficial Plan",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            color: AppColors.primaryColor,
                                            size: 32,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("12-Month Lease", style: blackText16600),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "₹2,499/month • Lowest cost for long-term use with full support & savings.",
                                                  style: greyText12400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 44,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Handle action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            elevation: 2,
                                          ),
                                          child: Text("Choose Plan", style: whiteText14600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                // ================================================================
                //
                // Text(
                //   "Current Plan",
                //   style: TextStyle(
                //     fontSize: 22,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black87,
                //   ),
                // ),

                Center(
                  child: SizedBox(
                    height: screenHeight(context) * 0.50,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: plan.length,
                      itemBuilder: (context, index) {
                        double itemWidth = 250;
                        double itemOffset = index * itemWidth;
                        double scrollOffset = _scrollController.offset;
                        double centerPosition = scrollOffset + screenWidth(context) / 2 - itemWidth / 2;
                        double distance = (centerPosition - itemOffset).abs();

                        // ✨ Fancy transition factors
                        double scale = (1 - (distance / screenWidth(context))).clamp(0.9, 1.0);
                        double opacity = (1 - (distance / screenWidth(context))).clamp(0.08, 0.25);
                        double blur = ((1 - (distance / screenWidth(context))) * 20).clamp(0.0, 20.0);
                        double spread = ((1 - (distance / screenWidth(context))) * 3).clamp(0.0, 3.0);

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          transform: Matrix4.identity()..scale(scale),
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          child: CustomPlanCard(
                            title: plan[index]["title"],
                            price: plan[index]["price"],
                            subtitle: plan[index]["subtitle"],
                            icon: plan[index]["icon"],
                            boxShadow: BoxShadow(
                              color: Colors.black.withOpacity(opacity),
                              blurRadius: blur,
                              spreadRadius: spread,
                              offset: const Offset(0, 6),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}





