import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/core/constants/text_style.dart';
import 'package:lepster/core/utils/helper_function.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lepster/screens/profile_screen/setting_screen.dart';
import 'package:lepster/screens/profile_screen/verify_user_security.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../widgets/custom_page_route.dart';
import '../notification_screen/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  // hello
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
                clipBehavior: Clip.none,
                children: [
                  // Background Cover Image
                  Container(
                    width: double.infinity, // 👈 ensures full width of screen
                    height: 140, // customize as needed
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.chetak.com/-/media/Assets/bajajauto/blogs/chetak/blogs-chetak3',
                        ),
                        fit: BoxFit.cover, // 👈 covers full container area
                      ),
                    ),
                  ),


                  // Positioned Profile Image
                  Positioned(
                    bottom: -5, // brings it down, half out of the cover
                    left: 110,
                    child: Stack(
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
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text("Jenny Wilson", style: blackText16600),
              Text("howard09@gmail.com", style: greyText14600),
              const SizedBox(height: 20),

              EditButton(
                text: 'Edit Profile',
                onTap: () {
                  // Your edit action
                  print('Edit tapped');
                },
              ),

              // Info Cards
              // _glassInfoRow([
              //   _infoTile("Gender", "Male"),
              //   _infoTile("Age", "20 Years"),
              // ]),
              // _glassInfoRow([
              //   _infoTile("Height", "176 cm"),
              //   _infoTile("Weight", "76 kg"),
              // ]),
              // const SizedBox(height: 20),



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
                    onTap: (){
                      Navigator.push(
                        context,
                        CustomPageRoute(child: NotificationScreen()),
                      );
                    }
                  ),
                  _tileItem(
                    icon: Icons.featured_play_list,
                    title: "App Features",
                    index: 1,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
                    }
                  ),
                  _tileItem(
                      icon: Icons.security,
                      title: "Security Features",
                      index: 2,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AppSecurity()));
                      }
                  ),
                  _tileItem(
                    icon: Icons.settings,
                    title: "App Settings",
                    index: 3,
                    children: [
                      {'icon': Icons.security               , 'title': 'Privacy Policy'},
                      {'icon': Icons.article_outlined, 'title': 'Terms & Conditions'},
                      {'icon': Icons.system_update        , 'title': 'App Version $_appVersion'},
                    ],
                  ),
                  _tileItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      index: 4,

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

  // Widget _tileItem({
  //   required IconData icon,
  //   required String title,
  //   String? subtitle,
  //   Function()? onTap,
  //   int? index,
  //   List<Map<String, dynamic>>? children,
  // }) {
  //   bool isExpanded = _expandedIndex == index;
  //
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       ListTile(
  //         leading: Icon(icon, color: AppColors.primaryColor),
  //         title: Text(title, style: blackText14600),
  //         subtitle: subtitle != null
  //             ? Text(subtitle, style: greyText13600)
  //             : null,
  //         trailing: children != null
  //             ? Icon(
  //           isExpanded ? Icons.expand_less : Icons.expand_more,
  //           color: Colors.grey,
  //         )
  //             : const Icon(Icons.chevron_right),
  //         onTap: () {
  //           if (children != null) {
  //             setState(() {
  //               _expandedIndex = isExpanded ? null : index;
  //             });
  //           } else if (onTap != null) {
  //             onTap();
  //           }
  //         },
  //       ),
  //
  //       // CHILDREN if expanded
  //       if (isExpanded && children != null)
  //         Padding(
  //           padding: const EdgeInsets.only(left: 32),
  //           child: Column(
  //             children: children.map((item) {
  //               return _tileItem(
  //                 icon: item['icon'],
  //                 title: item['title'],
  //                 subtitle: item['subtitle'],
  //                 onTap: item['onTap'],
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //     ],
  //   );
  // }


  Widget _tileItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Function()? onTap,
    int? index,
    List<Map<String, dynamic>>? children,
    bool isChild = false,
  }) {
    bool isExpanded = _expandedIndex == index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16), // Same for all
          leading: Icon(icon, color: AppColors.primaryColor , size: isChild ? 20 : 25,), // ✅ Icon for both parent & child
          // title: Text(title, style: blackText14600),
          title: Text(title ,style:isChild  ? TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[900]) // 👈 Child text style
        : blackText14600,),
          subtitle: subtitle != null
              ? Text(subtitle, style: greyText13600)
              : null,
          trailing: !isChild
              ? (children != null
              ? Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.grey,
          )
              : const Icon(Icons.chevron_right))
              : null, // ❌ Child ke liye trailing icon hata diya
          onTap: () {
            if (children != null && !isChild) {
              setState(() {
                _expandedIndex = isExpanded ? null : index;
              });
            } else if (onTap != null) {
              onTap();
            }
          },
        ),

        if (isExpanded && children != null)
          Column(
            children: children.map((item) {
              return _tileItem(
                icon: item['icon'],
                title: item['title'],
                subtitle: item['subtitle'],
                onTap: item['onTap'],
                isChild: true, // 👈 Very important
              );
            }).toList(),
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

class EditButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const EditButton({
    super.key,
    this.text = 'Edit',
    required this.onTap,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    this.icon = Icons.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10,),
              Icon(
                icon,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}