import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String email;
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String password;
  bool loading = false;
  final formkey = GlobalKey<FormState>();

  void login() async {
    if (formkey.currentState.validate()) {
      var connectivityResult =
      await Connectivity().checkConnectivity(); // User defined class
      print(connectivityResult);
      // ignore: unrelated_type_equality_checks
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        setState(() {
          loading = true;
        });
        try {
          context.read<AuthService>().signIn(
            email: email.trim(),
            password: password,
          );
          // final user = await _auth.signInWithEmailAndPassword(
          //     email: email.trim(), password: password);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[Colors.teal, Colors.black] // red to
                        ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Nakshatra',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 190.0, 0.0, 0.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Hospital',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(298.0, 155.0, 0.0, 0.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 120.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400].withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextFormField(
                                    validator: (val) {
                                      return val.isNotEmpty || val.length > 4
                                          ? null
                                          : "Enter your username";
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      //Do something with the user input.
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        fontSize: 13.0,
                                      ),
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
                              SizedBox(
                                height: 40.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400].withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextFormField(
                                    validator: (val) {
                                      return val.isNotEmpty || val.length > 6
                                          ? null
                                          : "Enter the password";

                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      //Do something with the user input.
                                      password = value;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        fontSize: 13.0,
                                      ),
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
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        BouncingWidget(
                          scaleFactor: _scaleFactor,
                          stayOnBottom: stayOnBottom,
                          onPressed: login,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                child: Container(
                                  height: 48.0,
                                  child: Material(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.black.withOpacity(0.8),
                                    elevation: 7.0,
                                    child: Center(
                                      child: Text(
                                        'Login',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
