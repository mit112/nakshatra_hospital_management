import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/new_report_screen.dart';
import 'package:nakshatra_hospital_management/screens/view_reports.dart';

import '../constants/constants.dart';

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
          '${widget.post.data()['Firstname']}',
          style: kFieldStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Text(
                      //     '${widget.post.data()['Firstname']} ${widget.post.data()['Surname']}',
                      //     style: GoogleFonts.openSans(
                      //       textStyle: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 30.0,
                      //         letterSpacing: 0.5,
                      //         //fontWeight:FontWeight.normal,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'First Name :   ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                widget.post.data()['Firstname'],
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Surname :   ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                widget.post.data()['Surname'],
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number :   ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                pNumber,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Date of Birth :  ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                widget.post.data()['BirthDate'],
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'address : ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                pAddress,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Visits :  ',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            widget.post.data()['Visits'].toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 130.0,
                      ),
                      BouncingWidget(
                        scaleFactor: _scaleFactor,
                        stayOnBottom: stayOnBottom,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewReportScreen(widget.post)));
                        },
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      BouncingWidget(
                        scaleFactor: _scaleFactor,
                        stayOnBottom: stayOnBottom,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewReports(widget.post)));
                        },
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
                          ],
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
    );
  }
}
