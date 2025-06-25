import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/gradient.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Battery Low",
      message: "Your EV battery is below 20%.",
      time: DateTime.now().subtract(const Duration(minutes: 10)),
      icon: Icons.battery_alert,
      color: Colors.redAccent,
    ),
    NotificationItem(
      title: "Charging Complete",
      message: "Your EV is now fully charged.",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      icon: Icons.bolt,
      color: Colors.green,
    ),
    NotificationItem(
      title: "Ride Summary",
      message: "You rode 15.3 km in the last trip.",
      time: DateTime.now().subtract(const Duration(days: 1)),
      icon: Icons.directions_bike,
      color: Colors.blueAccent,
    ),
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: appGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    customBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    horizontalSpacing(10),
                    Text('Notifications', style: whiteText20600),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return NotificationCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime time;
  final IconData icon;
  final Color color;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      shadowColor: item.color.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: item.color.withOpacity(0.1),
              child: Icon(item.icon, color: item.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: item.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.message,
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    DateFormat('dd MMM, hh:mm a').format(item.time),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
