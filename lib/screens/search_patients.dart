import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/patient_registration_form.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:nakshatra_hospital_management/screens/ot_register.dart';
import 'package:provider/provider.dart';

class SearchPatients extends StatefulWidget {
  @override
  _SearchPatientsState createState() => _SearchPatientsState();
}

class _SearchPatientsState extends State<SearchPatients> {
  List name;
  Map<String, dynamic> patientMap;

  bool isLoading = false;
  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore
        .collection('patients')
        .where('Name', isGreaterThanOrEqualTo: searchController.text)
        .get()
        .then((value) {
      setState(() {
        patientMap = value.docs[0].data();
        isLoading = false;
      });
      print('*********************************');
      print(patientMap);
      print('*********************************');
      print('*********************************');
    });
  }
  //
  // searchUser() async {
  //   return await FirebaseFirestore.instance
  //       .collection("users")
  //       .where('Name', isEqualTo: searchController.text)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       print('*********************************');
  //       print('*********************************');
  //       print(value);
  //       Name = value;
  //     });
  //   });
  // }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Patients',
          style: kFieldStyle,
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    validator: (val) {
                      return val.isNotEmpty || val.length > 1
                          ? null
                          : "Enter your username";
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'Enter Patient Detail',
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                      icon: const Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 6.0, bottom: 4.0),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSearch();
                    },
                    child: Text(
                      'Search',
                      style: kFieldStyle,
                    ),
                  ),
                  patientMap != null
                      ? ListTile(
                          leading: Icon(Icons.account_box, color: Colors.black),
                          title: Text(
                            patientMap['Name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(patientMap['Address']),
                        )
                      : Container(),
                ],
              ),
            ),
    );
  }
}
