import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nakshatra_hospital_management/constants.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/userScreens/view_report.dart';
import 'patient_info.dart';

class ViewPatients extends StatefulWidget {
  @override
  _ViewPatientsState createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  DocumentSnapshot doc;
  // String name='h';
  String currentid;

  String uid = auth.currentUser.uid.toString();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');
  Future getPosts() async {
    QuerySnapshot qn = await collectionReference.get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                )));
  }

  // CollectionReference get report =>
  //     collectionReference.doc(currentid).collection('patient report');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        title: Text('Patients'),
        backgroundColor: Color(0XFFB577FF),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
                // ignore: missing_return
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].data()["patient Name"],
                      style: kFieldStyle,
                    ),
                    onTap: () => navigateToDetail(snapshot.data[index]),
                  );
                });
          }
        },
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: collectionReference.snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       // var user = snapshot.data;
      //       return ListView.separated(
      //         separatorBuilder: (_, snapshot) => Divider(
      //           height: 25.0,
      //         ),
      //         itemCount: snapshot.data.docs.length,
      //         itemBuilder: (context, index) {
      //           DocumentSnapshot patients = snapshot.data.docs[index];
      //           return Column(
      //             children: [
      //               SizedBox(
      //                 height: 15.0,
      //               ),
      //
      //               ExpansionTile(
      //                 // iconColor: Colors.greenAccent,
      //                 // collapsedIconColor: Colors.white,
      //                 title: RichText(
      //                   text: new TextSpan(
      //                     style: new TextStyle(
      //                       fontSize: 25.0,
      //                     ),
      //                     children: <TextSpan>[
      //                       new TextSpan(
      //                         text: 'Patient Name: ',
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                       new TextSpan(
      //                         text: '${patients['patient Name']}',
      //                         style: TextStyle(color: Colors.greenAccent),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //
      //                 // title: Text(
      //                 //   'Patient Name: ' + '${patients['patient Name']}',
      //                 //   style: kFieldStyle,
      //                 // ),
      //                 subtitle: RichText(
      //                   text: new TextSpan(
      //                     style: new TextStyle(
      //                       fontSize: 25.0,
      //                     ),
      //                     children: <TextSpan>[
      //                       new TextSpan(
      //                         text: 'Phone Number: ',
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                       new TextSpan(
      //                         text: '${patients['phone number']}',
      //                         style: TextStyle(color: Colors.greenAccent),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 // subtitle: Text(
      //                 //   'Phone Number: ' + '${patients['phone number']}',
      //                 //   style: kFieldStyle,
      //                 // ),
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.only(
      //                       left: 15.0,
      //                     ),
      //                     child: Align(
      //                       alignment: Alignment.centerLeft,
      //                       child: Column(
      //                         children: [
      //                           RichText(
      //                             text: new TextSpan(
      //                               style: new TextStyle(
      //                                 fontSize: 25.0,
      //                               ),
      //                               children: <TextSpan>[
      //                                 new TextSpan(
      //                                   text: 'Address: ',
      //                                   style: TextStyle(color: Colors.white),
      //                                 ),
      //                                 new TextSpan(
      //                                   text: '${patients['address']}',
      //                                   style: TextStyle(
      //                                       color: Colors.greenAccent),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             height: 5.0,
      //                           ),
      //                           RichText(
      //                             text: new TextSpan(
      //                               style: new TextStyle(
      //                                 fontSize: 25.0,
      //                               ),
      //                               children: <TextSpan>[
      //                                 new TextSpan(
      //                                   text: 'First Visit: ',
      //                                   style: TextStyle(color: Colors.white),
      //                                 ),
      //                                 new TextSpan(
      //                                   text: '${patients['date']}',
      //                                   style: TextStyle(
      //                                       color: Colors.greenAccent),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           // Text(
      //                           //   'Address: ' + '${patients['address']}',
      //                           //   style: kFieldStyle,
      //                           // ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               // Card(
      //             ],
      //           );
      //         },
      //       );
      //     } else
      //       return Container();
      //   },
      // ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          widget.post.data()['patient Name'],
          style: kFieldStyle,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text(
                widget.post.data()['patient Name'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['phone number'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['address'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['date'],
                style: kFieldStyle,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Patient Report',
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['first visit'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['fee details'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['fee collected'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['flu symptoms'],
                style: kFieldStyle,
              ),
              Text(
                'Other',
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['other'] ?? 'not available',
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['other expenses'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['body temp'],
                style: kFieldStyle,
              ),
              // RoundedButtonlogin(
              //   onPressed: () {},
              //   title: 'View Report',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

const kFieldStyle = TextStyle(
  fontFamily: 'PoiretOne',
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 25.0,
);
