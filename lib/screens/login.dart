import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/homepage.dart';
import 'package:nakshatra_hospital_management/screens/patient_form.dart';
import 'package:provider/provider.dart';
import 'package:nakshatra_hospital_management/constants/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
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
                    padding: EdgeInsets.fromLTRB(15.0, 190.0, 0.0, 0.0),
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
                    padding: EdgeInsets.fromLTRB(298.0, 155.0, 0.0, 0.0),
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

              SizedBox(height: 120,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          validator: (val) {
                            return val.isNotEmpty || val.length > 4 ? null : "Enter your username";
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            //Do something with the user input.
                            email = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                              height: 1.5,
                            ),
                            icon: const Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, left: 6.0, bottom: 4.0),
                              child: const Icon(Icons.email_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        validator: (val) {
                          return val.length>6 ? null : "Enter the password";
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          //Do something with the user input.
                          password = value;
                        },

                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                          icon: const Padding(
                            padding: const EdgeInsets.only(
                                top: 6.0, left: 6.0, bottom: 4.0),
                            child: const Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Container(
                      height: 45.0,
                      child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent.withOpacity(0.8),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            var connectivityResult = await Connectivity()
                                .checkConnectivity(); // User defined class
                            print(connectivityResult);
                            // ignore: unrelated_type_equality_checks
                            if (connectivityResult == ConnectivityResult.mobile ||
                                connectivityResult == ConnectivityResult.wifi) {
                              try {
                                context.read<AuthService>().signIn(
                                  email: email.trim(),
                                  password: password;

                                // final user = await _auth.signInWithEmailAndPassword(
                                //     email: email.trim(), password: password);
                              }catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              'Login',
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
      ),
    );
  }
}
