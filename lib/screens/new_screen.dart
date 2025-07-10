import 'package:flutter/material.dart';

class EV3DModelScreen extends StatefulWidget {
  const EV3DModelScreen({super.key});

  @override
  State<EV3DModelScreen> createState() => _EV3DModelScreenState();
}

class _EV3DModelScreenState extends State<EV3DModelScreen> {
  // late O3DController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EV 3D Viewer'),
        backgroundColor: Colors.green,
      ),
      // body: const Center(
      //   child: O3D(
      //     src: 'assets/modul/titi_the_chill_frog.glb',
      //     autoRotate: true,
      //     cameraControls: true,
      //     autoPlay: true,
      //     ar: false,
      //     backgroundColor: Colors.white,
      //   ),
      // ),
    );
  }
}
//
//
//
// // =============================================
// //  dono alag alag code hai
//
// // class DigitalWalletApp extends StatelessWidget {
// //   const DigitalWalletApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF8F8F8),
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         titleSpacing: 0,
// //         title: Row(
// //           children: [
// //             IconButton(
// //               icon: const Icon(Icons.menu),
// //               onPressed: () {},
// //             ),
// //             const Text.rich(
// //               TextSpan(
// //                 children: [
// //                   TextSpan(
// //                     text: 'Zuel',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontFamily: 'Pacifico',
// //                       fontSize: 20,
// //                     ),
// //                   ),
// //                   TextSpan(
// //                     text: 'Pay',
// //                     style: TextStyle(
// //                       color: Color(0xFF4CAF50),
// //                       fontFamily: 'Pacifico',
// //                       fontSize: 20,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const Spacer(),
// //             IconButton(
// //               icon: const Icon(Icons.qr_code),
// //               onPressed: () {},
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.query_builder),
// //               onPressed: () {},
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 80),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Quick Actions
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _quickAction(Icons.currency_bitcoin, 'Add Fund'),
// //                 _quickAction(Icons.currency_bitcoin_outlined, 'Rewards'),
// //                 _quickAction(Icons.currency_bitcoin, 'Payouts'),
// //               ],
// //             ),
// //             const SizedBox(height: 16),
// //
// //             // Services Banner
// //             _gradientBox(
// //               title: 'Services Offer',
// //               subtitle: 'Recharges, Bills, Flights & More',
// //               gradient: const LinearGradient(
// //                 colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //               ),
// //             ),
// //
// //             // Recent Transactions
// //             _recentTransactions(),
// //
// //             // Scan & Pay
// //             GestureDetector(
// //               onTap: () => debugPrint('Scan & Pay clicked'),
// //               child: _gradientBox(
// //                 title: 'Scan & Pay',
// //                 subtitle: 'Pay to Friends, Vendors, Shop & More',
// //                 gradient: const LinearGradient(
// //                   colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomRight,
// //                 ),
// //               ),
// //             ),
// //
// //             // Recharge Services
// //             // _iconGrid('Recharge Services', [
// //             //   [Remix.smartphone_line, 'Mobile'],
// //             //   [Remix.tv_line, 'DTH'],
// //             //   [Remix.road_map_line, 'Fastag'],
// //             //   [Remix.train_line, 'Metro'],
// //             //   [Remix.sim_card_line, 'Datacard'],
// //             // ]),
// //             //
// //             // // Bill Payments
// //             // _iconGrid('Bill Payments', [
// //             //   [Remix.flashlight_line, 'Electricity'],
// //             //   [Remix.water_flash_line, 'Water'],
// //             //   [Remix.gas_station_line, 'Gas'],
// //             //   [Remix.wifi_line, 'Broadband'],
// //             //   [Remix.building_line, 'Landline'],
// //             // ]),
// //
// //             // Offers Section
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 const Text('Special Offers', style: TextStyle(fontWeight: FontWeight.w500)),
// //                 TextButton(
// //                   onPressed: () {},
// //                   child: const Text('View All', style: TextStyle(color: Color(0xFF4CAF50))),
// //                 )
// //               ],
// //             ),
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(12),
// //               child: Column(
// //                 children: [
// //                   Image.network(
// //                     'https://readdy.ai/api/search-image?query=digital%20payment%20offers%2C%20cashback%20and%20discounts%20banner%2C%20vibrant%20colors%2C%20mobile%20payment%20app%20promotional%20banner%2C%20e-wallet%20offers&width=375&height=150&seq=12345&orientation=landscape',
// //                     height: 120,
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                   const Padding(
// //                     padding: EdgeInsets.all(8),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text('Cashback Festival', style: TextStyle(fontWeight: FontWeight.w500)),
// //                         SizedBox(height: 4),
// //                         Text('Get up to 10% cashback on all transactions. Valid until July 10, 2025.',
// //                             style: TextStyle(fontSize: 12, color: Colors.grey)),
// //                       ],
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         color: Colors.white,
// //         shape: const CircularNotchedRectangle(),
// //         notchMargin: 6.0,
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 8),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: [
// //               _bottomItem(Icons.home, 'Home', true),
// //               _bottomItem(Icons.search, 'Search', false),
// //               const SizedBox(width: 48),
// //               _bottomItem(Icons.flight, 'Travels', false),
// //               _bottomItem(Icons.wallet, 'Orders', false),
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: const Color(0xFF4CAF50),
// //         onPressed: () {},
// //         child: const Icon(Icons.fingerprint),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //     );
// //   }
// //
// //   Widget _quickAction(IconData icon, String label) {
// //     return Column(
// //       children: [
// //         Container(
// //           width: 56,
// //           height: 56,
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(12),
// //             boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
// //           ),
// //           child: Icon(icon, size: 28),
// //         ),
// //         const SizedBox(height: 4),
// //         Text(label, style: const TextStyle(fontSize: 12))
// //       ],
// //     );
// //   }
// //
// //   Widget _gradientBox({required String title, required String subtitle, required Gradient gradient}) {
// //     return Container(
// //       width: double.infinity,
// //       margin: const EdgeInsets.only(bottom: 16),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         gradient: gradient,
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
// //           const SizedBox(height: 4),
// //           Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13))
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _recentTransactions() {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               const Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.w500)),
// //               TextButton(
// //                 onPressed: () {},
// //                 child: const Text('View All', style: TextStyle(color: Color(0xFF4CAF50), fontSize: 13)),
// //               )
// //             ],
// //           ),
// //           _transactionItem(Icons.smartphone, 'Mobile Recharge', 'July 3, 2025', '₹ 499'),
// //           _transactionItem(Icons.flight, 'Electricity Bill', 'July 1, 2025', '₹ 1,250')
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _transactionItem(IconData icon, String title, String date, String amount) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Row(
// //             children: [
// //               CircleAvatar(
// //                 radius: 20,
// //                 backgroundColor: const Color(0xFF4CAF50).withOpacity(0.1),
// //                 child: Icon(icon, color: const Color(0xFF4CAF50)),
// //               ),
// //               const SizedBox(width: 12),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
// //                   Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
// //                 ],
// //               )
// //             ],
// //           ),
// //           Text(amount, style: const TextStyle(fontWeight: FontWeight.w500)),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _iconGrid(String title, List<List<dynamic>> icons) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
// //         const SizedBox(height: 8),
// //         GridView.builder(
// //           shrinkWrap: true,
// //           physics: const NeverScrollableScrollPhysics(),
// //           itemCount: icons.length,
// //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: 5,
// //             mainAxisSpacing: 8,
// //             crossAxisSpacing: 8,
// //             childAspectRatio: 0.75,
// //           ),
// //           itemBuilder: (context, index) {
// //             return Column(
// //               children: [
// //                 CircleAvatar(
// //                   backgroundColor: const Color(0xFFE0E0E0),
// //                   child: Icon(icons[index][0]),
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Text(
// //                   icons[index][1],
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(fontSize: 10),
// //                 ),
// //               ],
// //             );
// //           },
// //         )
// //       ],
// //     );
// //   }
// //
// //   Widget _bottomItem(IconData icon, String label, bool active) {
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Icon(icon, color: active ? const Color(0xFF4CAF50) : Colors.grey),
// //         Text(label, style: TextStyle(fontSize: 10, color: active ? const Color(0xFF4CAF50) : Colors.grey))
// //       ],
// //     );
// //   }
// // }
//
// // ===== ye alag ahi code
//
//
//
//
//
//

// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
//
// import '../core/utils/SharedPrefManager.dart';
//
// class FingerprintAuthScreen extends StatefulWidget {
//   @override
//   _FingerprintAuthScreenState createState() => _FingerprintAuthScreenState();
// }
//
// class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   String _status = 'Not Authenticated';
//   bool _isAuthenticating = false;
//
//   bool _alreadyVerified = false;
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPreviousAuthStatus(); // ✅ update
//   }
//
//
//   Future<void> _checkPreviousAuthStatus() async {
//     bool isVerified = await SharedPrefManager.getFingerprintStatus(); // ✅ update
//     print('📦 Previous fingerprint verified: $isVerified'); // ✅ update
//
//     if (isVerified) {
//       setState(() {
//         _status = '✅ You are a valid person'; // ✅ update
//         _alreadyVerified = true; // ✅ update
//       });
//     }
//   }
//
//   // ✅ NEW: Method to clear saved fingerprint data
//   Future<void> _clearFingerprintStatus() async {
//     await SharedPrefManager.setFingerprintStatus(false);
//     setState(() {
//       _alreadyVerified = false;
//       _status = 'Not Authenticated';
//     });
//     print('🧹 Fingerprint status cleared');
//   }
//
//
//   Future<void> _authenticate() async {
//     print('👉 Fingerprint scan button clicked');
//
//     setState(() {
//       _isAuthenticating = true;
//       _status = 'Touch the fingerprint sensor...';
//     });
//
//     print('🔐 Starting fingerprint authentication...');
//
//     try {
//       bool authenticated = await auth.authenticate(
//         localizedReason: 'Please authenticate to proceed',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           stickyAuth: true,
//         ),
//       );
//
//       print('✅ Authentication result: $authenticated');
//       if (_isAuthenticating) {
//         await SharedPrefManager.setFingerprintStatus(true);
//         print("🔐 Fingerprint authenticated and saved to SharedPrefs");
//       } else {
//         await SharedPrefManager.setFingerprintStatus(false);
//       }
//
//       setState(() {
//         _isAuthenticating = false;
//         _status = authenticated
//             ? '✅ You are a valid person'
//             : '❌ Access Denied!';
//         _alreadyVerified = authenticated;
//       });
//     } catch (e) {
//       print('❌ Error occurred during authentication: $e');
//       setState(() {
//         _isAuthenticating = false;
//         _status = 'Error: $e';
//       });
//     }
//
//     if (_isAuthenticating){
//       await SharedPrefManager.setFingerprintStatus(true); // ✅ update
//       print("🔐 Fingerprint authenticated and saved to SharedPrefs"); // ✅ update
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('🖼️ FingerprintAuthScreen build called');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Fingerprint Authentication')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _status,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//
//             if (_isAuthenticating)
//               const Icon(Icons.fingerprint, size: 80, color: Colors.blueAccent),
//
//             const SizedBox(height: 30),
//
//             if (!_alreadyVerified) // ✅ update
//               ElevatedButton.icon(
//                 onPressed: _authenticate,
//                 icon: const Icon(Icons.fingerprint),
//                 label: const Text('Scan Fingerprint'),
//               ),
//
//
//             if (!_alreadyVerified)
//             ElevatedButton.icon(
//               onPressed: _clearFingerprintStatus,
//               icon: const Icon(Icons.delete),
//               label: const Text('Clear Fingerprint Data'),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


