import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/userScreens/viewpatients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nakshatra_hospital_management/constants.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'patient_info.dart';

class ViewReport extends StatefulWidget {
  @override
  _ViewReportState createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  DocumentSnapshot doc;
  String uid = auth.currentUser.uid.toString();
  String currentid;
  // String reportid;
  // Future getPost() async {
  //   QuerySnapshot qn = await report.get();
  //   return qn.docs;
  // }
  // String feedetails;
  // String firstvisit;
  // Future<void> getName() async {
  //   DocumentSnapshot ds = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(currentid)
  //       .get();
  //   feedetails = ds.data()['fee details'];
  //   firstvisit = ds.data()['first visit'];
  // }

  //
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Patient Report',
          style: kFieldStyle,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot collectionReference =
                    snapshot.data.docs[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        // '${collectionReference['first visit']}',
                        firstvisit,
                        style: kFieldStyle,
                      ),
                      subtitle: Text(
                          // '${collectionReference['fee details']}',
                          feedetails,
                          style: kFieldStyle),
                    ),
                  ],
                );
              },
            );
          } else {
            return Container(
              child: Text(
                'No data found',
                style: kFieldStyle,
              ),
            );
          }
          ;
        },
      ),
    );
  }
}
