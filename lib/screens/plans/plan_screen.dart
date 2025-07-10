import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_sizing.dart';
import '../../core/constants/text_style.dart';
import '../../widgets/custom_back_buttom.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  String selectedCategory = "All";

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(10),
              BackBtnWithText(context: context, text: "View Our Plans"),
              // ------------------- Category Tabs -------------------
              verticalSpacing(20),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
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

              verticalSpacing(20),
              // ------------------- Plan Cards -------------------
              Expanded(
                child: SizedBox(
                  height: screenHeight(context) * 0.28,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredPlans.length,
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
                    color: AppColors.primaryColor.withOpacity(0.05),
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
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String price;
  final String subtitle;
  final Color color;

  const PlanCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.price,
    required this.subtitle,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenHeight(context) * 0.2,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.greyColor, width: 0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            // Icon(icon, size: 30, color: color),
            // const SizedBox(height: 12),

            // Plan Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: blackText16600,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            verticalSpacing(15),

            // Price
            Text(price, textAlign: TextAlign.center, style: primaryText20600),

            verticalSpacing(15),

            // Subtitle
            Text(subtitle, textAlign: TextAlign.center, style: greyText12400),
          ],
        ),
      ),
    );
  }
}
