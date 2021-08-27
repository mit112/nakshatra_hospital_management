
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List list = List();
  // String name='h';
  String currentid;
  String uid = auth.currentUser.uid.toString();
  // Timestamp t = document['Register Date'];
  // DateTime d = t.toDate();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');

  delete() async{
    print("checking");
    CollectionReference reference =
    FirebaseFirestore.instance.collection("patients");
    QuerySnapshot query = await reference.get();
    query.docs[0].reference.delete();
  }


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
              child:CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                // ignore: missing_return
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data[index].data();
                  final name = '${snapshot.data[index].data()["Firstname"]} ${snapshot.data[index].data()["Surname"]}';
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.2,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.black.withOpacity(0.8),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                  title: Text(
                                   '${snapshot.data[index].data()["Firstname"]} ${snapshot.data[index].data()["Surname"]} ',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Text(
                                   '${snapshot.data[index].data()["BirthDate"]}',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onTap: () => navigateToPatientDetail(
                                      snapshot.data[index]),
                                  leading: Container(
                                    child: Icon(
                                      FontAwesomeIcons.circleNotch,
                                      color: Colors.indigo[300],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ), //testing
                      secondaryActions: [
                        IconSlideAction(
                          caption: "Delete",
                          color:Colors.indigo[300],
                          icon: Icons.delete,
                          onTap: () {
                            delete();
                            ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$name dismissed')));
                      },

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
