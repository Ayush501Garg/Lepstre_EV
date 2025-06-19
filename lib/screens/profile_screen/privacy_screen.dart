import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lepster/utils/fake_text.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1E1E1E), // dark background
        appBar: AppBar(
          title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              TextClass.faketext,
              style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5,),
                textAlign: TextAlign.justify
            ),
          ),
        ),
      ),
    );
  }
}