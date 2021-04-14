import 'package:flutter/material.dart';
import 'file:///F:/Projects/Template/nakshatra_hospital_management/lib/constants/constants.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'file:///F:/Projects/Template/nakshatra_hospital_management/lib/screens/patient_info.dart';
import 'file:///F:/Projects/Template/nakshatra_hospital_management/lib/screens/viewpatients.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Nakshatra Hospital'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Nakshatra',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontFamily: 'Abel',
                        fontSize: 80.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Hospital',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontFamily: 'Abel',
                        fontSize: 80.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  RoundedButtonlogin(
                    onPressed: () {
                      context.read<AuthService>().signOut();
                    },
                    title: 'Sign out',
                  ),
                  RoundedButtonlogin(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PatientForm();
                          },
                        ),
                      );
                    },
                    title: 'patient form',
                  ),
                  RoundedButtonlogin(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewPatients();
                          },
                        ),
                      );
                    },
                    title: 'View patients',
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
