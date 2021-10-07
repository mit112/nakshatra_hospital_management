import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/patient_detail_screen.dart';
import 'package:nakshatra_hospital_management/services/data_controller.dart';

class SearchPatients extends StatefulWidget {
  @override
  _SearchPatientsState createState() => _SearchPatientsState();
}

class _SearchPatientsState extends State<SearchPatients> {
  List name;
  QuerySnapshot snapshotData;
  bool isExcecuted = false;
  Map<String, dynamic> patientMap;
  bool isSearching = false;
  // String name='h';
  Stream usersStream;
  bool isLoading = false;

  delete() async {
    print("checking");
    CollectionReference reference =
        FirebaseFirestore.instance.collection("patients");
    QuerySnapshot query = await reference.get();
    query.docs[0].reference.delete();
  }

  // void onSearch() async {
  //   FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await _firestore
  //       .collection('patients')
  //       .where('Name', isGreaterThanOrEqualTo: searchController.text)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       patientMap = value.docs[0].data();
  //       isLoading = false;
  //     });
  //     print('*********************************');n
  //     print('*********************************');
  //   });
  // }
  //
  // searchUser() async {
  //   return await FirebaseFirestore.instance
  //       .collection("users")
  //       .where('Name', isEqualTo: searchController.text)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       print('*********************************');
  //       print('*********************************');
  //       print(value);
  //       Name = value;
  //     });
  //   });
  // }
  Future getUserByUserName(String username) async {
    return FirebaseFirestore.instance
        .collection("patients")
        .where("Surname", isGreaterThanOrEqualTo: username)
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
            builder: (context) => PatientDetailScreen(
                  post: post,
                )));
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget searchUsersList() {
      return Container(
        height: 460,
        child: StreamBuilder(
          stream: usersStream,
          builder: (context, AsyncSnapshot snapshots) {
            if (snapshots.data == null)
              return Container(child: Center(child: Text("No data")));
            return ListView.builder(
              cacheExtent: 9999,
              itemCount: snapshots.data.docs.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final name =
                    '${snapshots.data.docs[index]['Firstname']} ${snapshots.data.docs[index]['Surname']}';
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
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
                                '${snapshots.data.docs[index]['Firstname']} ${snapshots.data.docs[index]['Surname']}',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                snapshots.data.docs[index]['BirthDate'],
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
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
                            SnackBar(content: Text('$name dismissed')));
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      );
      //
      // child: FutureBuilder<List>(
      //   future: futureFiles,
      //   builder:(context,snapshots){
      //     final video = snapshots.data;
      //     return ListView.builder(
      //       controller: _controllerOne,
      //       itemCount:4,
      //       scrollDirection: Axis.vertical,
      //       itemBuilder: (BuildContext context,int index) {
      //         return Stack(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(vertical:10,horizontal:15),
      //                 child: Container(
      //                   height:210,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     image:DecorationImage(
      //                       image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScVBk5ZgsN_ov5BSfG5-hKxughNHAW4UHDGQ&usqp=CAU"),
      //                       fit:BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left:160,top:80),
      //                 child: Container(
      //                   height:70,
      //                   width: 70,
      //                   decoration: BoxDecoration(
      //                     shape:BoxShape.circle,
      //                     color: Colors.white54,
      //                   ),
      //                   child: GestureDetector(
      //                       onTap: () {
      //                         Navigator.push(
      //                             context, MaterialPageRoute(
      //                             builder: (context) => Videoplayer(file:video![index]))
      //                         );
      //                       },
      //                       child: Icon(Icons.play_arrow,color: Colors.white,size:50,)),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 170,left:35),
      //                 child: Text('Exercise for Knee Pain',
      //                   style:TextStyle(
      //                     color: Colors.white,
      //                     fontSize:16.0,
      //                     fontWeight: FontWeight.w800,
      //                   ),
      //                 ),
      //               ),Padding(
      //                 padding: const EdgeInsets.only(top: 190,left:35),
      //                 child: Text('3 minutes',
      //                   style:TextStyle(
      //                     color: Colors.grey[300],
      //                     fontWeight: FontWeight.w400,
      //                     fontSize:15.0,
      //                   ),
      //                 ),
      //               ),
      //             ]
      //         );
      //
      //
      //       },
      //     );
      //   },
      //
      // ),
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              isExcecuted = false;
            });
          }),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      val.queryData(searchController.text).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExcecuted = true;
                        });
                      });
                    });
              }),
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Patients',
              hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
        backgroundColor: Colors.green,
      ),
      // body: isExcecuted
      //     ? searchedData()
      //     : Container(
      //         child: Center(
      //           child: Text('Search Patient',
      //               style: TextStyle(color: Colors.black, fontSize: 30.0)),
      //         ),
      //       ),
      body: Column(
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
                              border: InputBorder.none, hintText: "username"),
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
          isSearching ? searchUsersList() : Container()
        ],
      ),
    );

    // body: isLoading
    //     ? Center(
    //         child: Container(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : Container(
    //         child: Column(
    //           children: [
    //             TextFormField(
    //               controller: searchController,
    //               validator: (val) {
    //                 return val.isNotEmpty || val.length > 1
    //                     ? null
    //                     : "Enter your username";
    //               },
    //               keyboardType: TextInputType.emailAddress,
    //               textInputAction: TextInputAction.next,
    //               onChanged: (value) {
    //                 //Do something with the user input.
    //               },
    //               decoration: InputDecoration(
    //                 // border: InputBorder.none,
    //                 hintText: 'Enter Patient Detail',
    //                 hintStyle: TextStyle(
    //                   fontStyle: FontStyle.italic,
    //                   fontSize: 18.0,
    //                   height: 1.5,
    //                 ),
    //                 icon: const Padding(
    //                   padding: const EdgeInsets.only(
    //                       top: 6.0, left: 6.0, bottom: 4.0),
    //                   child: const Icon(Icons.search),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 5.0,
    //             ),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // onSearch();
    //               },
    //               child: Text(
    //                 'Search',
    //                 style: kFieldStyle,
    //               ),
    //             ),
    //             // patientMap != null
    //             //     ? ListTile(
    //             //         leading: Icon(Icons.account_box, color: Colors.black),
    //             //         title: Text(
    //             //           patientMap['Name'],
    //             //           style: TextStyle(
    //             //             color: Colors.black,
    //             //             fontSize: 17,
    //             //             fontWeight: FontWeight.w500,
    //             //           ),
    //             //         ),
    //             //         subtitle: Text(patientMap['Address']),
    //             //       )
    //             //     : Container(),
    //           ],
    //         ),
    //       ),
  }
}
