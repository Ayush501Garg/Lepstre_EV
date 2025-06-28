import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';

import '../../../core/constants/image_path.dart';
import '../../../widgets/custom_back_buttom.dart';

// class StationDetailScreen extends StatefulWidget {
//   const StationDetailScreen({super.key});
//
//   @override
//   State<StationDetailScreen> createState() => _StationDetailScreenState();
// }
//
// class _StationDetailScreenState extends State<StationDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Image.asset(
//                     '$box01img01_white',
//                     width: double.infinity,
//                     height: 280,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 16,
//                     left: 16,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.arrow_back, color: Colors.black),
//                     ),
//                   ),
//                   Positioned(
//                     top: 16,
//                     right: 16,
//                     child: Row(
//                       children: const [
//                         Icon(Icons.share, color: Colors.white),
//                         SizedBox(width: 12),
//                         Icon(Icons.bookmark_border, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 230,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           topRight: Radius.circular(40),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Warzawa Battery Swap Station',
//                             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: const [
//                               Icon(Icons.flash_on, color: Colors.green, size: 18),
//                               SizedBox(width: 4),
//                               Text('Open 24 hours  •  '),
//                               Icon(Icons.update, color: Colors.grey, size: 18),
//                               SizedBox(width: 4),
//                               Text('Updated 2 min ago'),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: const [
//                               Icon(Icons.location_on, color: Colors.grey),
//                               SizedBox(width: 4),
//                               Expanded(
//                                 child: Text('12, Domaniewska, 01-235 Warszawa, Poland'),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.2,
//                             child: ListView(
//                               scrollDirection: Axis.horizontal,
//                               children: [
//                             _fixedWidthInfoCard(
//                             title: 'Distance',
//                               value: '2.4 km',
//                               color: Colors.blue,
//                             ),
//                             _fixedWidthInfoCard(
//                               title: 'ETA',
//                               value: '6 min',
//                               color: Colors.orange,
//                             ),
//                             _fixedWidthInfoCard(
//                               title: 'Charger Type',
//                               value: 'CCS2, Type2',
//                               color: Colors.green,
//                             ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           const Text('Charging Rate: ₹15/kWh', style: TextStyle(fontSize: 16)),
//                           const SizedBox(height: 20),
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 8,
//                                   offset: Offset(0, 4),
//                                 )
//                               ],
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('Battery Availability',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     )),
//                                 const SizedBox(height: 16),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         padding: const EdgeInsets.all(16),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           border: Border.all(color: Colors.green, width: 1),
//                                           borderRadius: BorderRadius.circular(12),
//                                         ),
//                                         child: Column(
//                                           children: const [
//                                             Text('Available Now', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
//                                             SizedBox(height: 8),
//                                             Text('2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                                             Text('Fully Charged'),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Expanded(
//                                       child: Container(
//                                         padding: const EdgeInsets.all(16),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           border: Border.all(color: Colors.orange, width: 1),
//                                           borderRadius: BorderRadius.circular(12),
//                                         ),
//                                         child: Column(
//                                           children: const [
//                                             Text('Charging...', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
//                                             SizedBox(height: 8),
//                                             Text('4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                                             Text('50–80%'),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 12),
//                                 const Text('✅ Safe battery usage recommended >50'),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Colors.teal,
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: const Text(
//                                     'Book Now',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 16),
//                               Expanded(
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(vertical: 16),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(color: Colors.teal),
//                                     color: Colors.white,
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: const Text(
//                                     'Get Directions',
//                                     style: TextStyle(
//                                       color: Colors.teal,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 24),
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(16),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 4),
//                                 )
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: const [
//                                 Row(
//                                   children: [
//                                     Icon(Icons.star, color: Colors.amber, size: 20),
//                                     SizedBox(width: 6),
//                                     Text('4.5'),
//                                     SizedBox(width: 4),
//                                     Text('(124 Reviews)', style: TextStyle(color: Colors.grey)),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.phone, color: Colors.green, size: 20),
//                                     SizedBox(width: 6),
//                                     Text('+91 9876543210'),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 32),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _fixedWidthInfoCard({
//     required String title,
//     required String value,
//     required Color color,
//   }) {
//     return Container(
//       width: 130,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold, color: color),
//           ),
//           const SizedBox(height: 4),
//           Text(value, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }




class StationDetailScreen extends StatefulWidget {
  const StationDetailScreen({super.key});

  @override
  State<StationDetailScreen> createState() => _StationDetailScreenState();
}

class _StationDetailScreenState extends State<StationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image with Back Button
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 280,
                    width: double.infinity,
                    child: Image.asset(
                      '$box01img01_white',
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: customBackButton(),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ⭐ Bookmark Icon
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.bookmark_border, color: AppColors.primaryColor),
                        ),
                        const SizedBox(width: 12),
                        // 📤 Share Icon
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.share, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // White Container with Content
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Warzawa Battery Swap Station',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(Icons.flash_on, color: Colors.green, size: 18),
                          SizedBox(width: 4),
                          Text('Open 24 hours  •  '),
                          Icon(Icons.update, color: Colors.grey, size: 18),
                          SizedBox(width: 4),
                          Text('Updated 2 min ago'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(Icons.location_on, color: Colors.grey),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text('12, Domaniewska, 01-235 Warszawa, Poland'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Horizontal Scrollable Cards
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _fixedWidthInfoCard(
                              title: 'Distance',
                              value: '2.4 km',
                              color: Colors.blue,
                            ),
                            _fixedWidthInfoCard(
                              title: 'ETA',
                              value: '6 min',
                              color: Colors.orange,
                            ),
                            _fixedWidthInfoCard(
                              title: 'Charger Type',
                              value: 'CCS2, Type2',
                              color: Colors.green,
                            ),
                            _fixedWidthInfoCard(
                              title: 'Charging Speed',
                              value: '150 kW',
                              color: Colors.purple,
                            ),
                            _fixedWidthInfoCard(
                              title: 'Connector',
                              value: 'DC Fast',
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text('Charging Rate: ₹15/kWh', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 20),

                      // Battery Availability Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Battery Availability',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.green.shade100, Colors.green.shade50],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      border: Border.all(color: Colors.green, width: 1),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.battery_charging_full, color: Colors.green, size: 32),
                                        SizedBox(height: 8),
                                        Text(
                                          'Available Now',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Fully Charged',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.orange.shade100, Colors.orange.shade50],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      border: Border.all(color: Colors.orange, width: 1),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orange.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.battery_std, color: Colors.orange, size: 32),
                                        SizedBox(height: 8),
                                        Text(
                                          'Charging...',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '50–80%',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.info_outline, color: Colors.green, size: 18),
                                  SizedBox(width: 6),
                                  Text(
                                    'Recommended battery >50%',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.teal),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Get Directions',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Rating and Contact Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                SizedBox(width: 6),
                                Text('4.5'),
                                SizedBox(width: 4),
                                Text('(124 Reviews)', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone, color: Colors.green, size: 20),
                                SizedBox(width: 6),
                                Text('+91 9876543210'),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),
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

  Widget _fixedWidthInfoCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}