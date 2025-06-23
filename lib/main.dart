import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'myApp.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Jo bhi color chahiye de do yaha
    statusBarIconBrightness: Brightness.dark, // white icons (for dark background)
    // Brightness.dark agar light background ho
  ));
  runApp(MyApp());
}

