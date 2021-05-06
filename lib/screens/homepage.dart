import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/patient_form.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:nakshatra_hospital_management/userScreens/ot_register.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stack(
              //   children: <Widget>[
              //     Container(
              //       padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
              //       child: Text(
              //         'Nakshatra',
              //         style: GoogleFonts.lato(
              //           textStyle: TextStyle(
              //             fontSize: 80.0,
              //             fontWeight: FontWeight.w300,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
              //       child: Text(
              //         'Hospital',
              //         style: GoogleFonts.lato(
              //           textStyle: TextStyle(
              //             fontSize: 80.0,
              //             fontWeight: FontWeight.w300,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.fromLTRB(294.0, 90.0, 0.0, 0.0),
              //       child: Text(
              //         '.',
              //         style: TextStyle(
              //             fontSize: 120.0,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.green),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Column(
                  children: [
                    BouncingWidget(
                      scaleFactor: _scaleFactor,
                      stayOnBottom: stayOnBottom,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Container(
                              height: 48.0,
                              child: Material(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor:
                                    Colors.greenAccent.withOpacity(0.8),
                                elevation: 7.0,
                                child: InkWell(
                                  splashColor: Colors.blue[100],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PatientForm()));
                                  },
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
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Container(
                              height: 48.0,
                              child: Material(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor:
                                Colors.greenAccent.withOpacity(0.8),
                                elevation: 7.0,
                                child: InkWell(
                                  splashColor: Colors.indigo[200],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ot_register()));
                                  },
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
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 60.0),
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
                                  child: InkWell(
                                    splashColor: Colors.blue[100],
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewPatients()));
                                    },
                                    child: Center(
                                      child: Text(
                                        'View Patients',
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 140,)
                  ],
                ),
              ),
            ],
          ),
        ),
      drawer: Drawer(
        elevation: 8.0,
        child: ListView(
          children: [
            Container(
              height: 170.0,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(""),
                  backgroundColor: Colors.blue[100],
                ),
                accountName: Text(
                  'Nakshatra Hospital.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                accountEmail: Text(
                  'hello@ac.in',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            // FlatButton(
            //   height: 50,
            //   onPressed: () {},
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.call,
            //         color: Colors.black54,
            //       ),
            //       SizedBox(
            //         width: 30,
            //       ),
            //       Text(
            //         'history',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 19.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.exit_to_app,
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
