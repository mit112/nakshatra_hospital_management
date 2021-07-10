import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/patient_registration_form.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:nakshatra_hospital_management/screens/ot_register.dart';
import 'package:provider/provider.dart';

class Search_Patients extends StatefulWidget {
  @override
  _Search_PatientsState createState() => _Search_PatientsState();
}

class _Search_PatientsState extends State<Search_Patients> {
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
        .where("Name", isEqualTo: searchController.text)
        .get()
        .then((value) {
      setState(() {
        patientMap = value.docs[0].data();
        isLoading = false;
      });
      print('*********************************');
      print(name);
      print('*********************************');
      print('*********************************');
    });
  }

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
                ],
              ),
            ),
    );
  }
}
