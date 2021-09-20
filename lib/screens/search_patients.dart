import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/screens/patient_registration_form.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
import 'package:nakshatra_hospital_management/screens/view_patients.dart';
import 'package:nakshatra_hospital_management/screens/ot_register.dart';
import 'package:provider/provider.dart';
import 'package:nakshatra_hospital_management/services/data_controller.dart';
import 'package:get/get.dart';

class SearchPatients extends StatefulWidget {
  @override
  _SearchPatientsState createState() => _SearchPatientsState();
}

class _SearchPatientsState extends State<SearchPatients> {
  List name;
  QuerySnapshot snapshotData;
  bool isExcecuted = false;
  Map<String, dynamic> patientMap;

  bool isLoading = false;
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

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Get.to(DetailedScreen(),
              //     transition: Transition.downToUp,
              //     arguments: snapshotData.docs[index]);
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                snapshotData.docs[index].data()['Name'] ?? 'N/A',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              subtitle: Text(
                snapshotData.docs[index].data()['Address'] ?? 'N/A',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
          );
        },
      );
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
      body: isExcecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text('Search Patient',
                    style: TextStyle(color: Colors.black, fontSize: 30.0)),
              ),
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
