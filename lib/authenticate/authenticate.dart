import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/constants.dart';
import 'package:nakshatra_hospital_management/userScreens/homepage.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Nakshatra Hospital'),
        centerTitle: true,
      ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontFamily: kFont,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                        obscureText: true,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontFamily: kFont,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButtonlogin(
                      title: 'Log In',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Homepage();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
