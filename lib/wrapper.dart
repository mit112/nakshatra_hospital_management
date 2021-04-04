import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/authenticate/authenticate.dart';
import 'package:nakshatra_hospital_management/userScreens/homepage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either homepage or authenticate
    return Authenticate();
  }
}
