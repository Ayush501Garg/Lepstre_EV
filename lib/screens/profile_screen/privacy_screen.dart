import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepster/core/constants/app_color.dart';

import '../../core/utils/fake_text.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // dark background
        appBar: AppBar(
          title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              TextClass.faketext,
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5,),
                textAlign: TextAlign.justify
            ),
          ),
        ),
      ),
    );
  }
}