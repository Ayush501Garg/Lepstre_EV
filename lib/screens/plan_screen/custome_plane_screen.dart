// import 'package:flutter/material.dart';
//
// import '../../core/constants/app_color.dart';
// import '../../widgets/custom_plan_card.dart';
//
// class CustomePlaneScreen extends StatefulWidget {
//   const CustomePlaneScreen({super.key});
//
//   @override
//   State<CustomePlaneScreen> createState() => _CustomePlaneScreenState();
// }
//
// class _CustomePlaneScreenState extends State<CustomePlaneScreen> {
//   final PageController _pageController = PageController(viewportFraction: 0.70);
//   double _currentPage = 0;
//
//
//
//
//   final List<Map<String, dynamic>> plans = [
//     {
//       "title": "Starter Plan",
//       "price": "₹999",
//       "subtitle": "Perfect for individuals starting out.\nIncludes basic features and 24/7 support.",
//       "icon": Icons.lightbulb,
//     },
//     {
//       "title": "Professional",
//       "price": "₹2499",
//       "subtitle": "Ideal for professionals and small teams.\nIncludes extended features and priority support.",
//       "icon": Icons.work,
//     },
//     {
//       "title": "Business",
//       "price": "₹4999",
//       "subtitle": "Best for growing businesses.\nIncludes all features, analytics & integrations.",
//       "icon": Icons.business_center,
//     },
//     {
//       "title": "Enterprise",
//       "price": "₹9999",
//       "subtitle": "Custom solution for large organizations.\nDedicated manager and SLA guaranteed uptime.",
//       "icon": Icons.apartment,
//     },
//   ];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page ?? 0;
//       });
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(title: const Text("Our Plans")),
//       body: Center(
//         child: SizedBox(
//           height: 420,
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: plans.length,
//             itemBuilder: (context, index) {
//               final plan = plans[index];
//               final scale = (_currentPage - index).abs() < 1
//                   ? 1 - (_currentPage - index).abs() * 0.1
//                   : 0.9;
//
//               return Transform.scale(
//                 scale: scale,
//                 child: CustomPlanCard(
//                   title: plan["title"],
//                   price: plan["price"],
//                   subtitle: plan["subtitle"],
//                   icon: plan["icon"],
//                 )
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
