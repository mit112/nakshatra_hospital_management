import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:open_file/open_file.dart';

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

  String notes = '';
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String filePath;

  Future<String> downloadFile(String imageName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    filePath = '${appDocDir.path}/$imageName.jpeg';
    File downloadToFile = File(filePath);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/${widget.patientId}/${widget.post.data()['report id']}')
          .writeToFile(downloadToFile);
      return filePath;
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.post.data()['notes'] != null) {
      notes = widget.post.data()['notes'];
    } else {
      notes = 'no notes';
    }
    downloadFile('${widget.patientId}/${widget.post.data()['report id']}');
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
                              style: kBoldStyle,
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
                              style: kBoldStyle,
                            ),
                            Text(
                              widget.post.data()['body temp'],
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
                              'Flu symptoms : ',
                              style: kBoldStyle,
                            ),
                            Text(
                              '${widget.post.data()['flu symptoms']}',
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
                              'fee collected : ',
                              style: kBoldStyle,
                            ),
                            Text(
                              widget.post.data()['fee collected'],
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
                              'fee details : ',
                              style: kBoldStyle,
                            ),
                            Text(
                              widget.post.data()['fee details'],
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
                              'Notes : ',
                              style: kBoldStyle,
                            ),
                            Text(
                                notes,
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
                          OpenFile.open(filePath);
                        },
                        child: Center(
                          child: Text(
                            'Show Image',
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
      ),
    );
  }
}

