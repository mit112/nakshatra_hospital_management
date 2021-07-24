import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/constants/constants.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'patient_detail_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

  navigateToPatientDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PatientDetailScreen(
                  post: post,
                )));
  }

  // CollectionReference get report =>
  //     collectionReference.doc(currentid).collection('patient report');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Patients',
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
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.3,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5 ),
                          child: Card(
                            elevation:4,
                            shadowColor:Colors.black.withOpacity(0.8),
                            color:Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              title: Text(
                                snapshot.data[index].data()["Name"],
                                style:  GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                               "25/05/2021",
                                style:  GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () =>
                                  navigateToPatientDetail(snapshot.data[index]),
                              leading:  Icon(
                                Icons.format_list_numbered,
                                color: Colors.blueGrey,
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                    secondaryActions: [
                      IconSlideAction(
                        caption: "Edit",
                        color: Colors.green,
                        icon: Icons.edit,
                        onTap: (){},
                      ),
                      IconSlideAction(
                        caption: "Delete",
                        color: Colors.green,
                        icon: Icons.edit,
                        onTap: (){},
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}



 const kFieldStyle = TextStyle(
  letterSpacing: 1.2,
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 18.0,
);
