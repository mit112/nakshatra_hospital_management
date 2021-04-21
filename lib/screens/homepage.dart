import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/constants/constants.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/screens/patient_form.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

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
        elevation: 8.0,
        backgroundColor: Colors.green[500],
        title: Text(
            'Homepage',
            style:GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize:23.0,
                letterSpacing: 0.5,
                //fontWeight:FontWeight.normal,
              ),
            ),
        ),
      ),
      drawer:Drawer(
        elevation: 8.0,
        child: ListView(
          children: [
            Container(
              height: 170.0,
              child: UserAccountsDrawerHeader(
                accountName:Text(
                  'Nakshatra Hospital.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                accountEmail: Text(
                  'hello@ac.in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius:40.0,
                  backgroundImage: NetworkImage(""),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 4.5,
            ),
          ],
        ),



    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                  child: Text(
                    'Nakshatra',
                    style:GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: Text(
                    'Hospital',
                    style:GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(294.0, 90.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 120.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60,),
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child:Container(
                          height:48.0,
                          child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent.withOpacity(0.8),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => PatientForm())
                                );
                              },
                              child:Center(
                                child: Text(
                                  'PatientForm',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
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
                  SizedBox(height: 40,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child:Container(
                          height:48.0,
                          child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent.withOpacity(0.8),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => ViewPatients())
                                );
                              },
                              child:Center(
                                child: Text(
                                  'ViewPatients',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
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

                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:FloatingActionButton(
        child:Icon(
          Icons.exit_to_app,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          context.read<AuthService>().signOut();
        },
      ),
    );
  }
}

