import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../core/constants/image_path.dart';
import '../../../widgets/custom_list_function.dart';

class StationScreen  extends StatefulWidget {
  Map<String, dynamic>? selectedStation;

   StationScreen ({super.key,this.selectedStation});

  @override
  State<StationScreen > createState() =>  _StationScreenState();
}

class _StationScreenState extends State<StationScreen > {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showCupertinoModalBottomSheet(
    //     context: context,
    //     expand: false,
    //     isDismissible: false,
    //     enableDrag: false,
    //     barrierColor: Colors.transparent,
    //     backgroundColor: Colors.transparent,
    //     topRadius: const Radius.circular(20),
    //     useRootNavigator: true,
    //     /// Directly pass the content widget
    //     builder: (context) => BottomSheetSnapContent(
    //       stations: stations,
    //     ),
    //   );
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        isDismissible: false,
        enableDrag: false,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        topRadius: const Radius.circular(20),
        useRootNavigator: true,
        builder: (context) => BottomSheetSnapContent(
          stations: stations,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Direct screen close without waiting for bottom sheet to dismiss
        Navigator.of(context).pop();
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: GestureDetector(
            onTap: () {
              print("click on Charging Stations Map text");
            },
            child: Image.asset(map_PhotoGrid),
          ),
        ),
      ),
    );

  }

  // Widget bottomContent(BuildContext context, ScrollController controller) {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 40,
  //           height: 5,
  //           margin: const EdgeInsets.only(bottom: 10),
  //           decoration: BoxDecoration(
  //             color: Colors.grey[400],
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //         // Top card
  //         Card(
  //           elevation: 1,
  //           shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //           child: Container(
  //             height: 100,
  //             padding: const EdgeInsets.all(12),
  //             child: Row(
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(12),
  //                   child: Image.network(
  //                     stations[0]['image'],
  //                     height: 80,
  //                     width: 80,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 Expanded(
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       const SizedBox(width: 8),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: const [
  //                           Row(
  //                             children: [
  //                               Icon(Icons.location_on,
  //                                   color: Colors.redAccent, size: 20),
  //                               SizedBox(width: 6),
  //                               Text(
  //                                 "Nearby Stations",
  //                                 style: TextStyle(
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ],
  //                           ),
  //                           SizedBox(height: 4),
  //                           Text(
  //                             "10+ stations within 10km",
  //                             style:
  //                             TextStyle(fontSize: 14, color: Colors.grey),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //
  //         /// Scrollable List
  //         Expanded(
  //           child: ListView.builder(
  //             controller: controller,
  //             itemCount: stations.length,
  //             itemBuilder: (context, index) {
  //               final station = stations[index];
  //               return Card(
  //                 margin: const EdgeInsets.symmetric(vertical: 6),
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(12)),
  //                 child: Container(
  //                   height: 80,
  //                   padding:
  //                   const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                   child: Row(
  //                     children: [
  //                       ClipRRect(
  //                         borderRadius: BorderRadius.circular(8),
  //                         child: Image.network(
  //                           station['image'],
  //                           height: 60,
  //                           width: 60,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                       const SizedBox(width: 12),
  //                       Expanded(
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 Container(
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.green.withOpacity(0.1),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   padding: const EdgeInsets.all(6),
  //                                   child: const Icon(
  //                                     Icons.bolt_rounded,
  //                                     size: 18,
  //                                     color: Colors.green,
  //                                   ),
  //                                 ),
  //                                 const SizedBox(width: 8),
  //                                 Text(
  //                                   "${station['batteries']} charging available",
  //                                   style: const TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.w600,
  //                                     color: Colors.black87,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             const SizedBox(height: 4),
  //                             Text(
  //                               station['distance'],
  //                               style: const TextStyle(
  //                                   fontSize: 14, color: Colors.grey),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

}

// class BottomSheetSnapContent extends StatefulWidget {
//   final List<Map<String, dynamic>> stations;
//
//   const BottomSheetSnapContent({super.key, required this.stations});
//
//   @override
//   State<BottomSheetSnapContent> createState() => _BottomSheetSnapContentState();
// }
//
// class _BottomSheetSnapContentState extends State<BottomSheetSnapContent> {
//   Map<String, dynamic>? selectedStation;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return WillPopScope(
//       onWillPop: () async {
//         // When back is pressed on bottom sheet, close the entire screen
//         Navigator.of(context, rootNavigator: true).pop(); // Close bottom sheet
//         Navigator.of(context).pop(); // Close the screen
//         return false; // Prevent default behavior
//       },
//       child: DraggableScrollableSheet(
//         initialChildSize: 300 / screenHeight,
//         minChildSize: 250 / screenHeight,
//         maxChildSize: 0.95,
//         snap: true,
//         snapSizes: [
//           250 / screenHeight,
//           300 / screenHeight,
//           0.95,
//         ],
//         builder: (context, controller) {
//           return Container(
//             padding: const EdgeInsets.all(16),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             ),
//             child: Scaffold(
//               backgroundColor: Colors.white,
//               body: Column(
//                 children: [
//                   /// Grabber Bar
//                   GestureDetector(
//                     onVerticalDragUpdate: (_) {}, // Disable manual dragging beyond allowed
//                     child: Container(
//                       width: 60,
//                       height: 5,
//                       margin: const EdgeInsets.only(bottom: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[400],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//
//                   /// Selected Station Detail
//                   if (selectedStation != null) ...[
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: GestureDetector(
//                         onVerticalDragUpdate: (details) {
//                           // Forward the drag to parent scroll
//                           controller.jumpTo(controller.offset - details.delta.dy);
//                         },
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min, // Important: Minimize column size
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(12),
//                                   child: CachedNetworkImage(
//                                     imageUrl: selectedStation?['image'] ?? '',
//                                     height: 70,
//                                     width: 70,
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       height: 70,
//                                       width: 70,
//                                       color: Colors.grey[300],
//                                       child: const Icon(Icons.image, color: Colors.grey),
//                                     ),
//                                     errorWidget: (context, url, error) => Image.network(
//                                       "https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180",
//                                       height: 70,
//                                       width: 70,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 16),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         selectedStation!['name'] ?? 'EV Station',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.black87,
//                                         ),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         '${selectedStation!['batteries']} slots available',
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.green,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Distance: ${selectedStation!['distance']}',
//                                         style: const TextStyle(
//                                           fontSize: 13,
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.green.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   padding: const EdgeInsets.all(10),
//                                   child: const Icon(
//                                     Icons.ev_station,
//                                     color: Colors.green,
//                                     size: 24,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: const [
//                                 Icon(Icons.info_outline, size: 20, color: Colors.blueGrey),
//                                 SizedBox(width: 8),
//                                 Expanded(
//                                   child: Text(
//                                     'Your way where you want to go',
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.blueGrey,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//
//
//
//
//
//                   /// Stations List
//                   Expanded(
//                     child: ListView.builder(
//                       controller: controller,
//                       itemCount: widget.stations.length,
//                       itemBuilder: (context, index) {
//                         final station = widget.stations[index];
//
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedStation = station;
//                             });
//                           },
//                           child: Card(
//                             margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             color: Colors.white,
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(12),
//                                     child: CachedNetworkImage(
//                                       imageUrl: station['image'] ?? 'https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180',
//                                       height: 70,
//                                       width: 70,
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => Container(
//                                         height: 70,
//                                         width: 70,
//                                         color: Colors.grey[300],
//                                         child: const Icon(Icons.image, color: Colors.grey),
//                                       ),
//                                       errorWidget: (context, url, error) => Image.network(
//                                         "https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180",
//                                         height: 70,
//                                         width: 70,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 14),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           station['name'] ?? 'EV Station',
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black87,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 6),
//                                         Text(
//                                           '${station['batteries'] ?? 0} slots available',
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.green.withOpacity(0.1),
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                         padding: const EdgeInsets.all(10),
//                                         child: const Icon(
//                                           Icons.ev_station,
//                                           color: Colors.green,
//                                           size: 24,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 6),
//                                       Row(
//                                         children: [
//                                           const Icon(Icons.location_on, size: 14, color: Colors.grey),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             station['distance'] ?? 'distance',
//                                             style: const TextStyle(
//                                               fontSize: 13,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



class BottomSheetSnapContent extends StatefulWidget {
  final List<Map<String, dynamic>> stations;

  const BottomSheetSnapContent({super.key, required this.stations});

  @override
  State<BottomSheetSnapContent> createState() => _BottomSheetSnapContentState();
}

class _BottomSheetSnapContentState extends State<BottomSheetSnapContent> {
  Map<String, dynamic>? selectedStation;
  late DraggableScrollableController _dragController;

  @override
  void initState() {
    super.initState();
    _dragController = DraggableScrollableController();
  }

  @override
  void dispose() {
    _dragController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).pop();
        return false;
      },
      child: DraggableScrollableSheet(
        controller: _dragController,
        initialChildSize: 300 / screenHeight,
        minChildSize: 250 / screenHeight,
        maxChildSize: 0.95,
        snap: true,
        snapSizes: [
          250 / screenHeight,
          300 / screenHeight,
          0.95,
        ],
        builder: (context, scrollController) {
          return Scaffold(
            body : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  /// Grabber Bar
                  Container(
                    width: 60,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
            
                  /// Selected Station Detail
                  if (selectedStation != null) ...[
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        // Get current size from DraggableScrollableController
                        double currentSize = _dragController.size;
            
                        // Calculate delta relative to screen height
                        double delta = details.delta.dy / screenHeight;
                        double newSize = currentSize - delta;
            
                        // Clamp to valid range
                        newSize = newSize.clamp(
                            250 / screenHeight,
                            0.95
                        );
            
                        // Jump to new size using DraggableScrollableController
                        _dragController.jumpTo(newSize);
                      },
                      onVerticalDragEnd: (details) {
                        // Handle snapping based on velocity
                        double velocity = details.velocity.pixelsPerSecond.dy;
                        double currentSize = _dragController.size;
            
                        if (velocity.abs() > 300) {
                          if (velocity > 0) {
                            // Swiping down - go to smaller size
                            if (currentSize > 300 / screenHeight) {
                              _dragController.animateTo(
                                300 / screenHeight,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            } else {
                              _dragController.animateTo(
                                250 / screenHeight,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            }
                          } else {
                            // Swiping up - go to larger size
                            if (currentSize < 300 / screenHeight) {
                              _dragController.animateTo(
                                300 / screenHeight,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            } else {
                              _dragController.animateTo(
                                0.95,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                              );
                            }
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: selectedStation?['image'] ?? '',
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      height: 70,
                                      width: 70,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image, color: Colors.grey),
                                    ),
                                    errorWidget: (context, url, error) => Image.network(
                                      "https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        selectedStation!['name'] ?? 'EV Station',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${selectedStation!['batteries']} slots available',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        'Distance: ${selectedStation!['distance']}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
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
                              children: const [
                                Icon(Icons.info_outline, size: 20, color: Colors.blueGrey),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Your way where you want to go',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
            
                            // Drag indicator

                          ],
                        ),
                      ),
                    ),
                  ],
            
                  /// Stations List
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: widget.stations.length,
                      itemBuilder: (context, index) {
                        final station = widget.stations[index];
            
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStation = station;
                            });
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl: station['image'] ?? 'https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180',
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        height: 70,
                                        width: 70,
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.image, color: Colors.grey),
                                      ),
                                      errorWidget: (context, url, error) => Image.network(
                                        "https://tse2.mm.bing.net/th?id=OIP.55SAeERHIVvh-uS6j7K_agHaHa&pid=Api&P=0&h=180",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
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
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${station['batteries'] ?? 0} slots available',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
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
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on, size: 14, color: Colors.grey),
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
                                ],
                              ),
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
        },
      ),
    );
  }
}