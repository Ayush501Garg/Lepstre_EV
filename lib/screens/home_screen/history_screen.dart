import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lepster/core/constants/app_color.dart';

import '../../widgets/custom_list_function.dart';

class History_Screen extends StatefulWidget {
  const History_Screen({super.key});

  @override
  State<History_Screen> createState() => _History_ScreenState();
}

class _History_ScreenState extends State<History_Screen> {

  List<int> expandedIndexes = [];


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue, // Same color jo upar diya
        statusBarIconBrightness: Brightness.light, // or Brightness.dark as needed
    ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: historyData.length,
          itemBuilder: (context, index) {
            final item = historyData[index];
            final sectionTitle = item['sectionTitle'];
            final content = item['content'] as Map<String, String>;
            bool isExpanded = expandedIndexes.contains(index);
            // =================== yaha se string split logic use kr rha hooo =====================
              // Split string into words
            final words = sectionTitle.split(" ");

              // Last word
            final lastWord = words.isNotEmpty ? words.last : "";

              // First part (without last word)
            final firstPart = words.length > 1
                ? words.sublist(0, words.length - 1).join(" ") + " "
                : "";




            return Card(
              elevation: 1,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: AnimatedSize( // 👈 Smooth expand/collapse animation
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      // Title Row
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: firstPart,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: lastWord,
                              style: const TextStyle(
                                color:AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 3),

                      // Content
                      ...content.entries
                          .toList()
                          .take(isExpanded ? content.length : 1)
                          .map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  entry.key,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  entry.value.toString(),
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                      const SizedBox(height: 4),

                      // More Detail button
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isExpanded) {
                                expandedIndexes.remove(index);
                              } else {
                                expandedIndexes.add(index);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: isExpanded ? Colors.white :AppColors.btnColor,
                              border: Border.all(
                                color: AppColors.btnColor,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              isExpanded ? 'Less Detail' : 'More Detail',
                              style: TextStyle(
                                color: isExpanded ? AppColors.primaryColor : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );


          },
        ),
      ),
    );
  }
}
