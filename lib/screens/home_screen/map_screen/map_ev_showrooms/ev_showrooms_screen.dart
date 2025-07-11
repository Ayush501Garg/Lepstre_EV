// // station_showroom_sheet.dart
// // Complete, null‑safe Flutter code.
// // Paste into your project and set StationShowroomPage() as home to test.
//
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:lepster/core/constants/app_color.dart';
//
//
// class StationShowroomPage extends StatefulWidget {
//   const StationShowroomPage({super.key});
//   @override
//   State<StationShowroomPage> createState() => _StationShowroomPageState();
// }
//
// class _StationShowroomPageState extends State<StationShowroomPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Ensure context is ready before opening sheet.
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       openStationShowroomSheet(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Stations & Showrooms')),
//     body: const Center(
//       child: Text('Sheet will open automatically'),
//     ),
//   );
// }
//
// // Entry point ---------------------------------------------------------------
//
//
// // Bottom‑sheet launcher ------------------------------------------------------
// void openStationShowroomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//     ),
//     builder: (context) => const _StationShowroomSheetBody(),
//   );
// }
//
// // Bottom‑sheet body with tabs ------------------------------------------------
// class _StationShowroomSheetBody extends StatelessWidget {
//   const _StationShowroomSheetBody();
//
//   // Dummy JSON data ----------------------------------------------------------
//   List<Map<String, dynamic>> get _stations => List.generate(5, (i) => {
//     'name': 'ChargePoint ${i + 1}',
//     'batteries': 4 + i,
//     'distance': '${(i + 1) * 0.8} km',
//     'image': 'https://tse1.mm.bing.net/th/id/OIP.ucyirBGFNBJmM95g9DYvzAHaFj?pid=Api&P=0&h=180',
//   });
//
//   List<Map<String, dynamic>> get _showrooms => List.generate(5, (i) => {
//     'name': 'EV Showroom ${i + 1}',
//     'models': 10 + i * 2,
//     'distance': '${(i + 1) * 1.2} km',
//     'image': 'https://tse4.mm.bing.net/th/id/OIP.QsQzCroqCq-uMi5vMoeSTAHaEu?pid=Api&P=0&h=180',
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return SizedBox(
//       height: mediaQuery.size.height * 0.8,
//       child: DefaultTabController(
//         length: 2,
//         child: Column(
//           children: [
//             const TabBar(
//               tabs: [
//                 Tab(text: 'Charging Stations', icon: Icon(Icons.ev_station)),
//                 Tab(text: 'EV Showrooms', icon: Icon(Icons.two_wheeler)),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   // Stations list
//                   ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: _stations.length,
//                     itemBuilder: (context, index) => _buildStationCard(
//                       context,
//                       _stations[index],
//                       false,
//                     ),
//                   ),
//                   // Showrooms list
//                   ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: _showrooms.length,
//                     itemBuilder: (context, index) => _buildShowroomCard(
//                       context,
//                       _showrooms[index],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Station card (given) -----------------------------------------------------
//   Widget _buildStationCard(
//       BuildContext context,
//       Map<String, dynamic> station,
//       bool isSelected,
//       ) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 2,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: CachedNetworkImage(
//                 imageUrl: station['image'] ?? '',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Container(
//                   height: 70,
//                   width: 70,
//                   color: Colors.grey[300],
//                   child: const Icon(Icons.image, color: Colors.grey),
//                 ),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     station['name'] ?? 'EV Station',
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${station['batteries'] ?? 0} slots available',
//                     style: const TextStyle(fontSize: 14, color: Colors.green),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.location_on, size: 14, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text(
//                         station['distance'] ?? 'distance',
//                         style: const TextStyle(fontSize: 13, color: Colors.grey),
//                       ),
//                       const Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(builder: (context) => const StationDetailScreen()),
//                           // );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 5, left: 5),
//                           child: Text(
//                             'Get More',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               decorationColor: AppColors.primaryColor,
//                               fontSize: 14,
//                               color: AppColors.primaryColor,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Icon(Icons.ev_station, size: 24, color: Colors.green),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Showroom card ------------------------------------------------------------
//   Widget _buildShowroomCard(
//       BuildContext context,
//       Map<String, dynamic> showroom,
//       ) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 2,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: CachedNetworkImage(
//                 imageUrl: showroom['image'] ?? '',
//                 height: 70,
//                 width: 70,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Container(
//                   height: 70,
//                   width: 70,
//                   color: Colors.grey[300],
//                   child: const Icon(Icons.image, color: Colors.grey),
//                 ),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     showroom['name'] ?? 'EV Showroom',
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${showroom['models'] ?? 0} models available',
//                     style: const TextStyle(fontSize: 14, color: Colors.blue),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.location_on, size: 14, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text(
//                         showroom['distance'] ?? 'distance',
//                         style: const TextStyle(fontSize: 13, color: Colors.grey),
//                       ),
//                       const Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(builder: (context) => const ShowroomDetailScreen()),
//                           // );
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 5, left: 5),
//                           child: Text(
//                             'Get More',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               decorationColor: Colors.blue,
//                               fontSize: 14,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Icon(Icons.two_wheeler, size: 24, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }
// }

// station_showroom_sheet.dart (v2)
// Bottom sheet height tweaked (DraggableScrollableSheet)
// and list layout mirrors your existing Sliver workflow.



// station_showroom_sheet.dart (v3)
// Integrate TabBar + TabBarView inside existing SliverToBoxAdapter body.
// Station tab uses _buildStationCard, Showroom tab uses _buildShowroomCard.
// Cards, colors, and functionality unchanged except trailing icon.

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/image_path.dart';
import '../../../../data/data.dart';


// class StationDetailScreen extends StatelessWidget {
//   const StationDetailScreen({super.key});
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Station Detail')),
//     body: const Center(child: Text('Station detail here')),
//   );
// }
//
// class ShowroomDetailScreen extends StatelessWidget {
//   const ShowroomDetailScreen({super.key});
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text('Showroom Detail')),
//     body: const Center(child: Text('Showroom detail here')),
//   );
// }



class StationShowroomPage extends StatefulWidget {
  const StationShowroomPage({super.key});
  @override
  State<StationShowroomPage> createState() => _StationShowroomPageState();
}

class _StationShowroomPageState extends State<StationShowroomPage> with TickerProviderStateMixin {
  // final List<Map<String, dynamic>> stations = List.generate(10, (i) => {
  //   'name': 'ChargePoint ${i + 1}',
  //   'batteries': 4 + i,
  //   'distance': '${(i + 1) * 0.8} km',
  //   'image': 'https://picsum.photos/seed/station$i/200',
  // });


  // final List<Map<String, dynamic>> showrooms = List.generate(8, (i) => {
  //   'name': 'EV Showroom ${i + 1}',
  //   'models': 10 + i * 2,
  //   'distance': '${(i + 1) * 1.2} km',
  //   'image': 'https://picsum.photos/seed/showroom$i/200',
  // });

  Map<String, dynamic>? selectedStation;

  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();



  int selectedTab = 0; // Add this as a class variable
  // List<Map<String, dynamic>> showrooms = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const map_image = map1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Your existing CustomScrollView

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. SliverAppBar with map image
              SliverAppBar(
                pinned: true,
                floating: false,
                automaticallyImplyLeading: false,
                expandedHeight: screenHeight * 0.55,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      map_image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),

              // SliverToBoxAdapter(
              //   child: Transform.translate(
              //     offset: const Offset(0, -20), // Overlap with map slightly
              //     child: _buildPickDropFields(),
              //   ),
              // ),
              //


              // 2. Combined body section
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      if (selectedStation != null) ...[
                        _buildSelectedStationCard(context),
                        const SizedBox(height: 16),
                      ],

                      // Tab Section
                      _buildTabSection(),
                      const SizedBox(height: 16),

                      // Content based on selected tab
                      _buildTabContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Overlay the pick/drop fields on top
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: _buildPickDropFields(),
          // ),

          Positioned(
            top: 0, // Position just above the white container
            left: 0,
            right: 0,
            child: _buildPickDropFields(),
          ),
        ],
      ),
    );
  }

  // ---------------- Station list (tab 0) ----------------

  Widget _buildPickDropFields() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          children: [
            // Pick up field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: pickupController,
                decoration: InputDecoration(
                  hintText: 'Pick up location',
                  prefixIcon: const Icon(Icons.my_location, color: Colors.green),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Drop field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: dropController,
                decoration: InputDecoration(
                  hintText: 'Drop location',
                  prefixIcon: const Icon(Icons.location_on, color: Colors.red),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 0; // Stations tab
                });
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Stations",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedTab == 0 ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: selectedTab == 0 ? Colors.green : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 1; // EV Showrooms tab
                });
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EV Showrooms",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: selectedTab == 1 ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: selectedTab == 1 ? Colors.green : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: selectedTab == 0 ? _buildStationsContent() : _buildShowroomsContent(),
    );
  }

  Widget _buildStationsContent() {
    return Column(
      key: const ValueKey('stations'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: stations.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final station = stations[index];
            final isSelected = selectedStation != null &&
                selectedStation!['name'] == station['name'];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStation = station;
                  });
                },
                child: _buildStationCard(
                  context,
                  station,
                  isSelected,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildShowroomsContent() {
    return Column(
      key: const ValueKey('showrooms'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: showrooms.length, // You'll need to add showrooms list
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final showroom = showrooms[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  // Handle showroom tap
                },
                child: _buildShowroomCard(
                  context,
                  showroom,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSelectedStationCard(BuildContext context) {
    final station = selectedStation!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.green, size: 20),
              const SizedBox(width: 8),
              const Text(
                "Selected Station",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => selectedStation = null),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.close, size: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: station['image'] ?? '',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 70,
                    width: 70,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      station['name'] ?? 'EV Station',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${station['batteries']} slots available',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          station['distance'] ?? 'distance',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.ev_station,
                  color: Colors.green,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 20, color: Colors.blueGrey),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Your way where you want to go',
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => StationDetailScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Get More',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStationCard(
      BuildContext context,
      Map<String, dynamic> station,
      bool isSelected,
      ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: station['image'] ?? '',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station['name'] ?? 'EV Station',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${station['batteries'] ?? 0} slots available',
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        station['distance'] ?? 'distance',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => StationDetailScreen(),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Get More',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.ev_station, size: 24, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildShowroomCard(
      BuildContext context,
      Map<String, dynamic> showroom,
      ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: showroom['image'] ?? '',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    showroom['name'] ?? 'EV Showroom',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${showroom['vehicles'] ?? 0} vehicles available',
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        showroom['distance'] ?? 'distance',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigate to showroom detail
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Get More',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.two_wheeler, size: 24, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

