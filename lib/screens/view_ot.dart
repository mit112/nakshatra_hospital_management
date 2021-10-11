import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/constants/constants.dart';
import 'package:nakshatra_hospital_management/screens/ot_report.dart';
import 'package:nakshatra_hospital_management/screens/patient_detail_screen.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
// import 'ot_oldreport.dart';

class Viewot extends StatefulWidget {
  @override
  _ViewotState createState() => _ViewotState();
}

class _ViewotState extends State<Viewot> {
  DocumentSnapshot doc;
  TextEditingController searchController = new TextEditingController();
  bool isSearching = false;
  String currentid;
  Stream usersStream;
  String uid = auth.currentUser.uid.toString();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('otregister');
  delete() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("otregister");
    QuerySnapshot query = await reference.get();
    query.docs[0].reference.delete();
  }

  Future getUserByUserName(String username) async {
    return FirebaseFirestore.instance
        .collection("otregister")
        .where("date", isGreaterThanOrEqualTo: username)
        .snapshots();
  }

  onSearchBtnClick() async {
    isSearching = true;
    setState(() {});
    usersStream = await getUserByUserName(searchController.text);
    setState(() {});
  }

  navigateToPatientDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => otreport(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'otregister',
          style: TextStyle(
            color: Colors.white,
            fontFamily: kFont,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      isSearching
                          ? GestureDetector(
                              onTap: () {
                                isSearching = false;
                                searchController.text = "";
                                setState(() {});
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Icon(Icons.arrow_back)),
                            )
                          : Container(),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(24)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "username"),
                              )),
                              GestureDetector(
                                  onTap: () {
                                    if (searchController.text != "") {
                                      onSearchBtnClick();
                                    }
                                  },
                                  child: Icon(Icons.search))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //isSearching ? searchUsersList() : Container()
              ],
            ),
            Container(
              height: 500,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("otregister")
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshots) {
                  if (snapshots.data == null)
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  return ListView.builder(
                    cacheExtent: 9999,
                    itemCount: snapshots.data.docs.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.8),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ListTile(
                                    title: Text(
                                      '${snapshots.data.docs[index]['date']}',
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onTap: () => navigateToPatientDetail(
                                        snapshots.data.docs[index]),
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
                            color: Colors.indigo[300],
                            icon: Icons.delete,
                            onTap: () {
                              delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('dismissed')));
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
