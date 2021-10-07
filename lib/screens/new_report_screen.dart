import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';

class NewReportScreen extends StatefulWidget {
  final DocumentSnapshot post;
  NewReportScreen(this.post);

  @override
  _NewReportScreenState createState() => _NewReportScreenState();
}

class _NewReportScreenState extends State<NewReportScreen> {
  final formKey = GlobalKey<FormState>();
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  bool check = false;
  bool octMachine = false,
      perimeter = false,
      medicine = false,
      externalDoctor = false,
      nurse = false,
      attendant = false;
  String flu, feeDetails, otherExpenses, feeAmount, otherFees, fileName, notes;
  String pTemp = '';
  String selectedDate;
  DocumentSnapshot doc;
  String uid = auth.currentUser.uid.toString();
  File file;
  String expensesString = '';
  List<String> expensesList = [];

  void expensesStringMaker() {
    if (octMachine) expensesList.add('Oct Machine');
    if (perimeter) expensesList.add('Perimeter');
    if (medicine) expensesList.add('Medicine');
    if (externalDoctor) expensesList.add('External Doctor');
    if (nurse) expensesList.add('Nurse');
    if (attendant) expensesList.add('Attendant');

    if (expensesList.isNotEmpty) {
      expensesString = expensesList[0];
      int length = expensesList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          expensesString += ', ' + expensesList[i];
    }
  }

  Future<void> uploadFile() async {
    try {
      //String fileExtension = file.path.split('.').last;
      fileName = 'files'
          '/${widget.post.data()['PatientId']}'
          '/ReportNo${widget.post.data()['Visits'] + 1}';

      String fileExtension = file.path.split('.').last;
      fileName += '.$fileExtension';

      await firebase_storage.FirebaseStorage.instance
          .ref(fileName)
          .putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<void> selectFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      file = File(result.files.single.path);
      print(result.files.single.path);
    } else {
      // User canceled the picker
    }
  }

  void addData() async {
    await uploadFile();

    if (formKey.currentState.validate()) {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('patients');

      print(fileName);

      expensesStringMaker();

      await collectionReference.doc(widget.post.data()['PatientId']).update({
        'Visits': widget.post.data()['Visits'] + 1,
      });

      collectionReference = FirebaseFirestore.instance
          .collection('patients')
          .doc(widget.post.data()['PatientId'])
          .collection('reports');
      String docName;

      docName = 'ReportNo${widget.post.data()['Visits'] + 1}';
      await collectionReference.doc(docName).set({
        'report id': docName,
        'date': selectedDate,
        'expenses': expensesString,
        'fee details': feeDetails,
        'fee collected': feeAmount,
        'body temp': pTemp,
        'flu symptoms': flu,
        'other expenses': otherExpenses,
        'other fees': otherFees,
        'notes': notes,
        'file name': fileName,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nakshatra-patient les & payments',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              letterSpacing: 0.5,
              //fontWeight:FontWeight.normal,
            ),
          ),
        ),
        elevation: 8.0,
        backgroundColor: Colors.green[500],
      ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Date of visit",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DateTimePicker(
                          initialValue: '',
                          type: DateTimePickerType.date,
                          dateLabelText: 'Select Date',
                          firstDate: DateTime(1995),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                selectedDate = value;
                              });
                            }
                          },
                          onSaved: (value) {
                            if (value.isNotEmpty) {
                              selectedDate = value;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Patient body temp. in deg.C",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton<String>(
                          value: 'Choose your temp',
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              pTemp = newValue;
                            });
                          },
                          items: <String>[
                            'Choose your temp',
                            '90',
                            '91',
                            '92',
                            '93',
                            '94',
                            '95',
                            '96',
                            '97',
                            '98',
                            '99',
                            '100',
                            '101',
                            '102',
                            '103',
                            '104',
                            '105',
                            '106',
                            '107',
                            '108',
                            '109',
                            '110'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Does the patient suffer from flu symptoms?',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'no',
                                  groupValue: flu,
                                  onChanged: (val) {
                                    flu = val;
                                    setState(() {});
                                  }),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'yes',
                                  groupValue: flu,
                                  onChanged: (val) {
                                    flu = val;
                                    setState(() {});
                                  }),
                              Text('Yes'),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Fee details',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'Paid online',
                                  groupValue: feeDetails,
                                  onChanged: (val) {
                                    feeDetails = val;
                                    setState(() {});
                                  }),
                              Text('Paid online'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'Paid in cash',
                                  groupValue: feeDetails,
                                  onChanged: (val) {
                                    feeDetails = val;
                                    setState(() {});
                                  }),
                              Text('Paid in cash'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'Not charged',
                                  groupValue: feeDetails,
                                  onChanged: (val) {
                                    feeDetails = val;
                                    setState(() {});
                                  }),
                              Text('Not charged'),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Fees collected in INR',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: '600',
                                  groupValue: feeAmount,
                                  onChanged: (val) {
                                    feeAmount = val;
                                    setState(() {});
                                  }),
                              Text('600'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: '500',
                                  groupValue: feeAmount,
                                  onChanged: (val) {
                                    feeAmount = val;
                                    setState(() {});
                                  }),
                              Text('500'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: '400',
                                  groupValue: feeAmount,
                                  onChanged: (val) {
                                    feeAmount = val;
                                    setState(() {});
                                  }),
                              Text('400'), //
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: '300',
                                  groupValue: feeAmount,
                                  onChanged: (val) {
                                    feeAmount = val;
                                    setState(() {});
                                  }),
                              Text('300'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 'no',
                                  groupValue: feeAmount,
                                  onChanged: (val) {
                                    feeAmount = val;
                                    setState(() {});
                                  }),
                              Text('200'),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: 'Others',
                                labelStyle: TextStyle(
                                  height: 1.2,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18.0,
                                ),
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9,]+')),
                              ],
                              onChanged: (val) {
                                otherFees = val ?? '0';
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Expenses for surgery/medicines/rented \nequipment etc.',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('OCT machine'),
                        value: this.octMachine,
                        onChanged: (bool value) {
                          setState(() {
                            this.octMachine = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Perimeter'),
                        value: this.perimeter,
                        onChanged: (bool value) {
                          setState(() {
                            this.perimeter = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Medicine'),
                        value: this.medicine,
                        onChanged: (bool check) {
                          setState(() {
                            this.medicine = check;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('External doctor'),
                        value: this.externalDoctor,
                        onChanged: (bool check) {
                          this.externalDoctor = check;
                          setState(() {});
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Nurse'),
                        value: this.nurse,
                        onChanged: (bool check) {
                          setState(() {
                            this.nurse = check;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Attendant'),
                        value: this.attendant,
                        onChanged: (bool check) {
                          setState(() {
                            this.attendant = check;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          onChanged: (val) {
                            otherExpenses = val;
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Others',
                            labelStyle: TextStyle(
                              height: 1.2,
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        "Enter additional details:",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          onChanged: (val) {
                            notes = val ?? ' ';
                            setState(() {});
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Notes',
                            labelStyle: TextStyle(
                              height: 1.2,
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          BouncingWidget(
                            scaleFactor: _scaleFactor,
                            stayOnBottom: stayOnBottom,
                            onPressed: selectFile,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0),
                                  child: Container(
                                    height: 48.0,
                                    child: Material(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor:
                                          Colors.greenAccent.withOpacity(0.8),
                                      elevation: 7.0,
                                      child: Center(
                                        child: Text(
                                          'Select file',
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          BouncingWidget(
                            scaleFactor: _scaleFactor,
                            stayOnBottom: stayOnBottom,
                            onPressed: addData,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60.0),
                                  child: Container(
                                    height: 48.0,
                                    child: Material(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor:
                                          Colors.greenAccent.withOpacity(0.8),
                                      elevation: 7.0,
                                      child: Center(
                                        child: Text(
                                          'Submit',
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String currentid;

// String reportid;
// Future getPost() async {
//   QuerySnapshot qn = await report.get();
//   return qn.docs;
// }

String feedetails;
String firstvisit;
Future<void> getName() async {
  DocumentSnapshot ds =
      await FirebaseFirestore.instance.collection('users').doc(currentid).get();
  feedetails = ds.data()['fee details'];
  firstvisit = ds.data()['first visit'];
  //hello world
}
