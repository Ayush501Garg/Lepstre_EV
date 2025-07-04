import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:provider/provider.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/widgets/custom_back_buttom.dart';
import 'package:lepster/widgets/custom_switch.dart';

import 'setting_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    final List<Map<String, dynamic>> settingsList = [
      {
        "key": "deviceConnectivity",
        "title": "Device Connectivity",
        "icon": Icons.devices,
      },
      {"key": "viewPlans", "title": "View Our Plans", "icon": Icons.payment},
      {
        "key": "startStopEv",
        "title": "Start / Stop EV",
        "icon": Icons.power_settings_new,
      },
      {"key": "speedLock", "title": "Speed Lock", "icon": Icons.lock},
      {"key": "lockEvApp", "title": "Lock EV App", "icon": Icons.security},
      {
        "key": "batteryTracking",
        "title": "Battery Tracking",
        "icon": Icons.battery_full,
      },
      {
        "key": "chargingStation",
        "title": "Charging Station",
        "icon": Icons.ev_station,
      },
      {
        "key": "newRelease",
        "title": "New Release Setting",
        "icon": Icons.new_releases,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              verticalSpacing(20),
              BackBtnWithText(context: context, text: "App Settings"),
              verticalSpacing(20),

              // List of individual cards
              Expanded(
                child: ListView.builder(
                  itemCount: settingsList.length,
                  itemBuilder: (context, index) {
                    final item = settingsList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primaryLightColor
                                .withOpacity(0.2),
                            child: Icon(
                              item["icon"],
                              color: AppColors.primaryColor,
                            ),
                          ),
                          title: Text(
                            item["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          trailing: CustomSwitchButton(
                            value: settings.getSetting(item["key"]),
                            onChanged: (val) =>
                                settings.toggleSetting(item["key"], val),
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
      ),
    );
  }
}
