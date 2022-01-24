import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/constants.dart';

const kFieldStyle = TextStyle(
  fontFamily: kFont,
  letterSpacing: 1.2,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 28.0,
);

class ReportDetailScreen extends StatefulWidget {
  final patientId;
  final DocumentSnapshot post;
  ReportDetailScreen({this.patientId, this.post});

  @override
  _ReportDetailScreenState createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  String notes;
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String filePath;
  String expenses;
  String otherFees;
  String otherExpenses;

  Future<String> downloadFile(String firebaseReference) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    filePath = '${appDocDir.path}/${firebaseReference.split('/').last}';
    File downloadToFile = File(filePath);
    if (downloadToFile.existsSync()) {
      await downloadToFile.delete();
    }
    await downloadToFile.create();

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(firebaseReference)
          .writeToFile(downloadToFile);
      return filePath;
    } catch (e) {
      print(e);
      return 'no file found';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.post.data()['file name']}');
    notes = widget.post.data()['notes'] ?? 'N/A';
    expenses = widget.post.data()['expenses'] ?? 'N/A';
    otherExpenses = widget.post.data()['other expenses'] ?? 'N/A';
    otherFees = widget.post.data()['other fees'] ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.post.data()['report id'],
          style: kFieldStyle,
        ),
      ),
      body: FutureBuilder(
          future: downloadFile(widget.post.data()['file name']),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasError) {
              return Center(
                child: Text(
                  'Connection Error',
                ),
              );
            } else if(snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
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
                                    widget.post.data()['report id'],
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
                                      'Date : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.post.data()['date'],
                                      style: kMyStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Temperature : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.post.data()['body temp'],
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
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Flu symptoms : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${widget.post.data()['flu symptoms']}',
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
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'fee collected : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.post.data()['fee collected'],
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
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Other Fees : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      otherFees,
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
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'fee details : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.post.data()['fee details'],
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
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expenses : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.post.data()['expenses'],
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
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Other Expenses : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      otherExpenses,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Notes : ',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      notes,
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
                                  height: 20.0,
                                ),
                                BouncingWidget(
                                  scaleFactor: _scaleFactor,
                                  stayOnBottom: stayOnBottom,
                                  onPressed: () => null,
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
                                            shadowColor:
                                            Colors.greenAccent.withOpacity(0.8),
                                            elevation: 7.0,
                                            child: InkWell(
                                              splashColor: Colors.indigo[200],
                                              onTap: () => OpenFile.open(filePath),
                                              child: Center(
                                                child: Text(
                                                  'Show File',
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
            } else {
              return Center(
                child: Text(
                  'Loading',
                ),
              );
            }
          }
      ),
    );
  }

}
