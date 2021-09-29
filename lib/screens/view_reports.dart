import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'report_detail_screen.dart';
import '../constants/constants.dart';

class ViewReports extends StatefulWidget {

  final post;
  ViewReports(this.post);

  @override
  _ViewReportsState createState() => _ViewReportsState();
}

class _ViewReportsState extends State<ViewReports> {

  CollectionReference collectionReference;

  Future getPosts() async {
    QuerySnapshot qn = await collectionReference.get();
    return qn.docs;
  }

  navigateToReportDetail(String patientId, DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReportDetailScreen(
              patientId: patientId,
              post: post,
            )));
  }

  @override
  void initState() {
    collectionReference = FirebaseFirestore.instance.collection('patients')
        .doc(widget.post.data()['PatientId'])
        .collection('reports');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(
            color: Colors.white,
            fontFamily: kFont,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext _, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.8),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text(
                            snapshot.data[index].data()["report id"],
                            style:  GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () => navigateToReportDetail(widget.post.data()['PatientId'], snapshot.data[index]),
                          leading:  Icon(
                            Icons.format_list_numbered,
                            color: Colors.blueGrey,
                        ),
                        )
                      )
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
