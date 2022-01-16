import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/ot_register.dart';
import 'package:nakshatra_hospital_management/screens/patient_registration_form.dart';
import 'package:nakshatra_hospital_management/screens/search_patients.dart';
import 'package:nakshatra_hospital_management/screens/view_ot.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Colors.green[500],
        title: Text(
          'Homepage',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              letterSpacing: 0.5,
              //fontWeight:FontWeight.normal,
            ),
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),

                accountName: Text(
                  'Nakshatra Eye Care.',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                accountEmail: Text(
                  'Nakshatra@ac.in',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientRegistrationForm()));
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chevronCircleDown,
                      color: Colors.indigo[300],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Patient Form',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ot_register()));
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chevronCircleDown,
                      color: Colors.indigo[300],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'OT Register',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewPatients()));
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chevronCircleDown,
                      color: Colors.indigo[300],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Registered Patients',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPatients()));
                },
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chevronCircleDown,
                      color: Colors.indigo[300],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Search Patients',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            //image code
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/homepagelogo.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Nakshatra',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 80.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Eye Care',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 60,
            ),
            Container(
              child: Column(
                children: [
                  BouncingWidget(
                    scaleFactor: _scaleFactor,
                    stayOnBottom: stayOnBottom,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientRegistrationForm()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 48.0,
                            child: Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent.withOpacity(0.8),
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'Patient Form',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BouncingWidget(
                    scaleFactor: _scaleFactor,
                    stayOnBottom: stayOnBottom,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ot_register()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 48.0,
                            child: Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent.withOpacity(0.8),
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'OT Register',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BouncingWidget(
                    scaleFactor: _scaleFactor,
                    stayOnBottom: stayOnBottom,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Viewot()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 48.0,
                            child: Material(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent.withOpacity(0.8),
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'Registered ot',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BouncingWidget(
                    scaleFactor: _scaleFactor,
                    stayOnBottom: stayOnBottom,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPatients()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 48.0,
                            child: InkWell(
                              splashColor: Colors.blue[100],
                              child: Material(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor:
                                    Colors.greenAccent.withOpacity(0.8),
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'Registered Patients',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BouncingWidget(
                    scaleFactor: _scaleFactor,
                    stayOnBottom: stayOnBottom,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPatients()));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 48.0,
                            child: InkWell(
                              splashColor: Colors.blue[100],
                              child: Material(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor:
                                    Colors.greenAccent.withOpacity(0.8),
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'Search Patients',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          //Icons.exit_to_app,
          FontAwesomeIcons.times,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        elevation: 8.0,
        onPressed: () {
          context.read<AuthService>().signOut();
        },
      ),
    );
  }
}
