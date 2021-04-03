import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/userScreens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nakshatra Hospital',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
      )),
      home: Homepage(),
    );
  }
}
