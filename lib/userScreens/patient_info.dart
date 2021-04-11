import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final formKey = GlobalKey<FormState>();
  String _flu,
      _firstTime,
      _feeDetails,
      _otherExpenses,
      _feeAmount,
      _other,
      _notes;

  String pName, pTemp, pAddress;
  String pNumber;
  String _selectedDate;
  DocumentSnapshot doc;
  String uid = auth.currentUser.uid.toString();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('patients');
  // CollectionReference personaldetails = collectionReference.doc(uid).collection('personal details');
  CollectionReference get personaldetails =>
      collectionReference.doc(uid).collection('personal details');
  CollectionReference get report =>
      collectionReference.doc(uid).collection('patient report');
  CollectionReference get feedetails =>
      collectionReference.doc(uid).collection('fee details');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nakshatra-patient les & payments'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DateTimePicker(
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
                        _selectedDate = value;
                      });
                    }
                  },
                  onSaved: (value) {
                    if (value.isNotEmpty) {
                      _selectedDate = value;
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) {
                    return val.isNotEmpty ? null : "Enter name";
                  },
                  //
                  onChanged: (val) {
                    pName = val;
                    setState(() {});
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Patient name ',
                    hintText: 'Enter name',
                    labelStyle: TextStyle(
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) {
                    return val.isNotEmpty ? null : "Enter Temp";
                  },
                  onChanged: (val) {
                    pTemp = val;
                    setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Patient body temp. in deg.C',
                    hintText: 'Enter email',
                    labelStyle: TextStyle(
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) {
                    return val.isNotEmpty ? null : "Enter number";
                  },
                  onChanged: (val) {
                    pNumber = val;
                    setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    hintText: 'Enter phone number',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 2,
                  validator: (val) {
                    return val.isNotEmpty ? null : "Enter address";
                  },
                  onChanged: (val) {
                    pAddress = val;
                    setState(() {});
                  },
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter password',
                    hintStyle: TextStyle(
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Does the patient suffer from flu symptoms?',
                          style: TextStyle(
                            fontSize: 15.0,
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
                            groupValue: _flu,
                            onChanged: (val) {
                              _flu = val;
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
                            groupValue: _flu,
                            onChanged: (val) {
                              _flu = val;
                              setState(() {});
                            }),
                        Text('Yes'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Is the patient visiting for the first time?',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'Yes',
                            groupValue: _firstTime,
                            onChanged: (val) {
                              _firstTime = val;
                              setState(() {});
                            }),
                        Text('Yes'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value:
                                'No, this is follow-up within one week of initial visit',
                            groupValue: _firstTime,
                            onChanged: (val) {
                              _firstTime = val;
                              setState(() {});
                            }),
                        Text('No, this is followup within one '
                            'week'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'No, but last visit was few weeks back',
                            groupValue: _firstTime,
                            onChanged: (val) {
                              _firstTime = val;
                              setState(() {});
                            }),
                        Text('No, but last visit was few weeks back'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Fee details',
                          style: TextStyle(
                            fontSize: 15.0,
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
                            groupValue: _feeDetails,
                            onChanged: (val) {
                              _feeDetails = val;
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
                            groupValue: _feeDetails,
                            onChanged: (val) {
                              _feeDetails = val;
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
                            groupValue: _feeDetails,
                            onChanged: (val) {
                              _feeDetails = val;
                              setState(() {});
                            }),
                        Text('Not charged'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Fees collected in INR',
                          style: TextStyle(
                            fontSize: 15.0,
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
                            groupValue: _feeAmount,
                            onChanged: (val) {
                              _feeAmount = val;
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
                            groupValue: _feeAmount,
                            onChanged: (val) {
                              _feeAmount = val;
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
                            groupValue: _feeAmount,
                            onChanged: (val) {
                              _feeAmount = val;
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
                            groupValue: _feeAmount,
                            onChanged: (val) {
                              _feeAmount = val;
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
                            groupValue: _feeAmount,
                            onChanged: (val) {
                              _feeAmount = val;
                              setState(() {});
                            }),
                        Text('200'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        // validator: (val) {
                        //   return val.isNotEmpty ? null : "Enter address";
                        // },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Others',
                          labelStyle: TextStyle(
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Expenses for surgery/medicines/rented equipment etc.',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'OCT machine',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('OCT machine'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'Perimeter',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('Perimeter'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'Medicine',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('Medicine'), //
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'External doctor',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('External doctor'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'Nurse',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('Nurse'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 'Attendant',
                            groupValue: _otherExpenses,
                            onChanged: (val) {
                              _otherExpenses = val;
                              setState(() {});
                            }),
                        Text('Attendant'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        // validator: (val) {
                        //   return val.isNotEmpty ? null : "Enter address";
                        // },
                        onChanged: (val) {
                          _other = val ?? ' ';
                          setState(() {});
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Others',
                          labelStyle: TextStyle(
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        maxLines: 3,
                        // validator: (val) {
                        //   return val.isNotEmpty ? null : "Enter address";
                        // },
                        onChanged: (val) {
                          _notes = val ?? ' ';
                          setState(() {});
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Notes',
                          labelStyle: TextStyle(
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('submit'),
                    onPressed: () async {
                      // print(_selectedDate);

                      if (formKey.currentState.validate()) {
                        await personaldetails.add({
                          'patient Name': pName,
                          'phone number': pNumber,
                          'date': _selectedDate,
                          'address': pAddress,
                        }).then((value) {
                          print(value.id);
                        });
                        await report.add({
                          'date': _selectedDate,
                          'body temp': pTemp,
                          'flu symptoms': _flu,
                          'first visit': _firstTime,
                          'other expenses': _otherExpenses,
                          'other': _other,
                          'notes': _notes,
                        }).then((value) {
                          print(value.id);
                        });
                        await feedetails.add({
                          'date': _selectedDate,
                          'fee details': _feeDetails,
                          'fee collected': _feeAmount,
                        }).then((value) {
                          print(value.id);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
