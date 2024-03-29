import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';

class PatientRegistrationForm extends StatefulWidget {
  const PatientRegistrationForm({Key key}) : super(key: key);

  @override
  _PatientRegistrationFormState createState() =>
      _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  final formKey = GlobalKey<FormState>();
  String dtoday = DateTime.now().toString();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime today = new DateTime.now();
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String pName, sName;
  String pAddress;
  String pNumber;
  String pBirthDate;
  DocumentSnapshot doc;
  String uid = auth.currentUser.uid.toString();
  String currentId;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');

  void addData() async {
    print(dateFormat);
    String docName;
    if (formKey.currentState.validate()) {
      docName = '$pName$pBirthDate';
      await collectionReference.doc(docName).set({
        'Firstname': pName,
        'Surname': sName,
        'Number': pNumber,
        'Address': pAddress,
        'BirthDate': pBirthDate,
        'Visits': 0,
        'PatientId': docName,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Registration',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            letterSpacing: 0.5,
          )),
        ),
        elevation: 8.0,
        backgroundColor: Colors.green[500],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.isNotEmpty ? null : "Enter name";
                        },
                        //
                        onChanged: (val) {
                          pName = val;
                          setState(() {});
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Firstname',
                          labelStyle: TextStyle(
                            height: 1.2,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.isNotEmpty ? null : "Enter Surname";
                        },
                        //
                        onChanged: (val) {
                          sName = val;
                          setState(() {});
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Surname',
                          labelStyle: TextStyle(
                            height: 1.2,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      DateTimePicker(
                        validator: (val) {
                          return val.isNotEmpty ? null : "Enter Date";
                        },
                        initialValue: '',
                        type: DateTimePickerType.date,
                        dateLabelText: 'Date of Birth',
                        firstDate:
                            DateTime.now().subtract(Duration(days: 36500)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              pBirthDate = value;
                            });
                          }
                        },
                        onSaved: (value) {
                          if (value.isNotEmpty) {
                            pBirthDate = value;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return null;
                        },
                        //
                        onChanged: (val) {
                          pAddress = val;
                          setState(() {});
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(
                            height: 1.2,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          pNumber = val;
                          setState(() {});
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                            height: 1.2,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      BouncingWidget(
                        scaleFactor: _scaleFactor,
                        stayOnBottom: stayOnBottom,
                        onPressed: addData,
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
                                    child: Center(
                                      child: Text(
                                        'Submit',
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
