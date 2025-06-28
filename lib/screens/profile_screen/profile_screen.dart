import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/core/utils/helper_function.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  int? _expandedIndex;
  String _appVersion = '';

  initState() {
    super.initState();
    getAppVersion();
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = picked;
      });
    }
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path))
                        : const AssetImage(user) as ImageProvider,
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text("Jenny Wilson", style: blackText16600),
              Text("howard09@gmail.com", style: greyText14600),
              const SizedBox(height: 20),

              // Info Cards
              _glassInfoRow([
                _infoTile("Gender", "Male"),
                _infoTile("Age", "20 Years"),
              ]),
              _glassInfoRow([
                _infoTile("Height", "176 cm"),
                _infoTile("Weight", "76 kg"),
              ]),
              const SizedBox(height: 20),

              _sectionCard(
                title: "Contact Us",
                items: [
                  _tileItem(
                    icon: Icons.email,
                    title: "Email",
                    subtitle: "support@lepster.com",
                    onTap: () {
                      print("Hiii");
                      launchEmail();
                    },
                  ),
                  _tileItem(
                    icon: Icons.app_blocking,
                    title: "WhatsApp",
                    subtitle: "+91 9876543210",
                    onTap: () {
                      launchWhatsApp();
                    },
                  ),
                  _tileItem(
                    icon: Icons.phone,
                    title: "Phone",
                    subtitle: "+91 1234567890",
                    onTap: () {
                      makePhoneCall();
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // _sectionCard(
              //   title: "Settings",
              //   items: [
              //     _tileItem(
              //       icon: Icons.notifications_active,
              //       title: "Notifications",
              //     ),
              //     _tileItem(icon: Icons.settings, title: "App Settings"),
              //     _tileItem(icon: Icons.logout, title: "Logout"),
              //   ],
              // ),

              _sectionCard(
                title: "Settings",
                items: [
                  _tileItem(
                    icon: Icons.notifications_active,
                    title: "Notifications",
                    index: 0,
                  ),
                  _tileItem(
                    icon: Icons.settings,
                    title: "App Settings",
                    index: 1,
                    children: [
                      {'icon': Icons.security               , 'title': 'Privacy Policy'},
                      {'icon': Icons.article_outlined, 'title': 'Terms & Conditions'},
                      {'icon': Icons.system_update        , 'title': 'App Version $_appVersion'},
                    ],
                  ),
                  _tileItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      index: 2,

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassInfoRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: children
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: e,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: primaryText14600),
          verticalSpacing(5),
          Text(value, style: blackText16600),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required List<Widget> items}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: blackText16600),
          const SizedBox(height: 12),
          ...items,
        ],
      ),
    );
  }

  Widget _tileItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Function()? onTap,
    int? index,
    List<Map<String, dynamic>>? children,
  }) {
    bool isExpanded = _expandedIndex == index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(title, style: blackText14600),
          subtitle: subtitle != null
              ? Text(subtitle, style: greyText13600)
              : null,
          trailing: children != null
              ? Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.grey,
          )
              : const Icon(Icons.chevron_right),
          onTap: () {
            if (children != null) {
              setState(() {
                _expandedIndex = isExpanded ? null : index;
              });
            } else if (onTap != null) {
              onTap();
            }
          },
        ),

        // CHILDREN if expanded
        if (isExpanded && children != null)
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              children: children.map((item) {
                return _tileItem(
                  icon: item['icon'],
                  title: item['title'],
                  subtitle: item['subtitle'],
                  onTap: item['onTap'],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }


  // Widget _tileItem({
  //   icon,
  //   title,
  //   subtitle,
  //   onTap,
  //   List<Widget>? children,
  // }) {
  //   return ListTile(
  //     leading: Icon(icon, color: AppColors.primaryColor),
  //     title: Text(title, style: blackText14600),
  //     subtitle: subtitle != null ? Text(subtitle, style: greyText13600) : null,
  //     trailing: const Icon(Icons.chevron_right),
  //     onTap: () {
  //       onTap();
  //     },
  //   );
  // }
}
