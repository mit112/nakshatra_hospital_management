import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/screens/new_report_screen.dart';
import 'package:nakshatra_hospital_management/screens/view_reports.dart';
import '../constants/constants.dart';
import 'ot_register.dart';

const kFieldStyle = TextStyle(
  fontFamily: kFont,
  letterSpacing: 1.2,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 28.0,
);

class PatientDetailScreen extends StatefulWidget {
  final DocumentSnapshot post;
  PatientDetailScreen({this.post});
  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {

  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String pNumber;
  String pAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pNumber = widget.post.data()['Number'] ?? 'N/A';
    pAddress = widget.post.data()['Address'] ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.post.data()['Name'],
          style: kFieldStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            widget.post.data()['Name'],
                            style: TextStyle(
                              fontFamily: kFont,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number:- ',
                              style: kBoldStyle,
                            ),
                            Text(
                              pNumber,
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'address:- ',
                              style: kBoldStyle,
                            ),
                            Text(
                              pAddress,
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Date of Birth:- ',
                              style: kBoldStyle,
                            ),
                            Text(
                              widget.post.data()['BirthDate'],
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Visits:- ',
                              style: kBoldStyle,
                            ),
                            Text(
                              widget.post.data()['Visits'].toString(),
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        BouncingWidget(
                          scaleFactor: _scaleFactor,
                          stayOnBottom: stayOnBottom,
                          onPressed: () {  },
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
                                                    NewReportScreen(widget.post)));
                                      },
                                      child: Center(
                                        child: Text(
                                          'New Report',
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
                          height: 20.0,
                        ),
                        BouncingWidget(
                          scaleFactor: _scaleFactor,
                          stayOnBottom: stayOnBottom,
                          onPressed: () {  },
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
                                                    ViewReports(widget.post)));
                                      },
                                      child: Center(
                                        child: Text(
                                          'Old Reports',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}