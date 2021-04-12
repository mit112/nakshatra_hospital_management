import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'patient_info.dart';

class ViewPatients extends StatefulWidget {
  @override
  _ViewPatientsState createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  DocumentSnapshot doc;
  String uid = auth.currentUser.uid.toString();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');
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
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var user = snapshot.data;
            return ListView.separated(
              separatorBuilder: (_, snapshot) => Divider(
                height: 25.0,
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot patients = snapshot.data.docs[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),

                    ExpansionTile(
                      // iconColor: Colors.greenAccent,
                      // collapsedIconColor: Colors.white,
                      title: RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Patient Name: ',
                              style: TextStyle(color: Colors.white),
                            ),
                            new TextSpan(
                              text: '${patients['patient Name']}',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                      ),

                      // title: Text(
                      //   'Patient Name: ' + '${patients['patient Name']}',
                      //   style: kFieldStyle,
                      // ),
                      subtitle: RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 25.0,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Phone Number: ',
                              style: TextStyle(color: Colors.white),
                            ),
                            new TextSpan(
                              text: '${patients['phone number']}',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                      ),
                      // subtitle: Text(
                      //   'Phone Number: ' + '${patients['phone number']}',
                      //   style: kFieldStyle,
                      // ),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                RichText(
                                  text: new TextSpan(
                                    style: new TextStyle(
                                      fontSize: 25.0,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: 'Address: ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      new TextSpan(
                                        text: '${patients['address']}',
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                RichText(
                                  text: new TextSpan(
                                    style: new TextStyle(
                                      fontSize: 25.0,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: 'First Visit: ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      new TextSpan(
                                        text: '${patients['date']}',
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   'Address: ' + '${patients['address']}',
                                //   style: kFieldStyle,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Card(
                  ],
                );
              },
            );
          } else
            return Container();
        },
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
