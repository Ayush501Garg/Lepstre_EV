import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_setting.dart';
import '../../core/utils/SharedPrefManager.dart';
import '../../provider/ToggleProvider.dart';
import '../../widgets/custom_back_buttom.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/custome_switch_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    _loadFingerprintStatus();
  }

  void _loadFingerprintStatus() async {
    bool status = await SharedPrefManager.getFingerprintStatus();
    setState(() {
      isVerified = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            verticalSpacing(20),

            Consumer<ToggleProvider>(
              builder: (context, toggle, child) {
                final isEnabled = toggle.getToggle("device_connection");

                return CustomeSwitchButton(
                  icon: Icons.card_travel_outlined,
                  title: "Device Connection",
                  switchValue: isVerified ? isEnabled : false,
                  onToggle: (val) async{
                    toggle.updateToggleWithVerification(context,"device_connection", val);
                  },
                );
              },
            ),

            Consumer<ToggleProvider>(
              builder: (context, toggle, child) {
                final isEnabled = toggle.getToggle("plan_card");
                return CustomeSwitchButton(
                  icon: Icons.card_travel_outlined,
                  title: "Plan Card",
                  switchValue: isVerified ? isEnabled : false,
                  onToggle: (val) {
                    toggle.updateToggleWithVerification(context,"plan_card", val);
                  },
                );
              },
            ),




            // CustomeSwitchButton(
            //   icon: Icons.notifications_active,
            //   title: "Bettery Saver Card",
            //   subtitle: "Enable or disable Widget",
            //   switchValue: AppSettings.showHiddenWidget.value,
            //   onToggle: (val) {
            //     setState(() {
            //       AppSettings.showHiddenWidget.value = val;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
