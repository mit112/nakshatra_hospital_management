import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ot_register(),
    ));

class ot_register extends StatefulWidget {
  @override
  _ot_registerState createState() => _ot_registerState();
}

class _ot_registerState extends State<ot_register> {
  final formKey = GlobalKey<FormState>();
  String _flu, swabResults, _feeDetails, _otherExpenses, _feeAmount;
  String pName, pTemp, pNumber, pAddress;
  String _selectedDate;
  String infecto;

  bool valuebaci = false,
      valueinfecto = false,
      valueopdwall = false,
      valuedeadwall = false,
      valueside = false,
      valuepassage = false,
      valueac = false,
      valuelower = false,
      valueupper = false,
      valuemicroscope = false,
      valuetable = false,
      valuetrolley = false,
      valuechair = false,
      valueaddtrolley = false,
      valuestool = false,
      value4corner = false,
      value2corner = false,
      value4cornerfloor = false,
      valueAC = false,
      valuebottom = false,
      valuetrolleybottom = false,
      valuetray = false,
      valueintristool = false,
      valueintrichair = false,
      valuebac = false,
      valueinfect = false,
      value20mlbac = false,
      value20mlinfect = false,
      valuetiles = false,
      valuegranite = false,
      valueescape = false,
      valueotdoor = false,
      valueexitdoor = false,
      valuebench = false,
      valuefan = false,
      valueouter = false,
      valueinside = false,
      valueAc = false,
      valuefloor = false,
      valueexit = false,
      valuewooden = false,
      valueFan = false,
      valueouterarea = false,
      valueinsidedrawer = false,
      valueaC = false,
      valueFloor = false,
      valuefumigation = false,
      valuemedicine = false,
      value4cornerupper = false,
      value4corneroffloor = false,
      value4cornerescape = false,
      valuewashbasin = false,
      valuewatertap = false,
      valuepurifier = false,
      valueunderneathbench = false,
      valueunderneathtrolley = false,
      valuechembac = false,
      valuecheminfect = false,
      valueOPD = false,
      valueDead = false,
      valueDoorside = false,
      valuePassageWall = false,
      valueACWall = false,
      valueLowerCeiling = false,
      valueUpperCeiling = false,
      valueStand = false,
      valueLegs = false,
      valueInstrument = false,
      valueaircondition = false,
      valueair = false,
      valueplate = false,
      valuebelow = false;

  String disinfectantsForManualCleaningString = '';
  List<String> disinfectantsForManualCleaningList = [];

  void disinfectantsForManualCleaningStringMaker() {
    if (valuebaci)
      disinfectantsForManualCleaningList
          .add('Bacilloid solution 20ml/1 ltr water');
    if (valueinfecto)
      disinfectantsForManualCleaningList
          .add('Infecto-Cide N 20 ml/1 ltr water');

    if (disinfectantsForManualCleaningList.isNotEmpty) {
      disinfectantsForManualCleaningString =
          disinfectantsForManualCleaningList[0];
      int length = disinfectantsForManualCleaningList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          disinfectantsForManualCleaningString +=
              ', ' + disinfectantsForManualCleaningList[i];
    }
  }

  String otAreaWipedCleanString = '';
  List<String> otAreaWipedCleanList = [];

  void otAreaWipedCleanStringMaker() {
    if (valueopdwall) otAreaWipedCleanList.add('OPD Wall');
    if (valuedeadwall) otAreaWipedCleanList.add('Dead Wall');
    if (valueside) otAreaWipedCleanList.add('Door side wall & door');
    if (valuepassage) otAreaWipedCleanList.add('Passage wall');
    if (valueac) otAreaWipedCleanList.add('AC wall');
    if (valuelower) otAreaWipedCleanList.add('Lower ceiling');
    if (valueupper) otAreaWipedCleanList.add('Upper ceiling');

    if (otAreaWipedCleanList.isNotEmpty) {
      otAreaWipedCleanString = otAreaWipedCleanList[0];
      int length = otAreaWipedCleanList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          otAreaWipedCleanString += ', ' + otAreaWipedCleanList[i];
    }
  }

  String otEquipmentWipedCleanString = '';
  List<String> otEquipmentWipedCleanList = [];

  void otEquipmentWipedCleanStringMaker() {
    if (valuemicroscope) otEquipmentWipedCleanList.add('Microscope Stand');
    if (valuetable) otEquipmentWipedCleanList.add('OT table, including legs');
    if (valuetrolley) otEquipmentWipedCleanList.add('Instrument trolley');
    if (valuechair) otEquipmentWipedCleanList.add('Surgeons chair');
    if (valueaddtrolley)
      otEquipmentWipedCleanList.add('Additional storage trolley');
    if (valuestool) otEquipmentWipedCleanList.add('Additional stool');

    if (otEquipmentWipedCleanList.isNotEmpty) {
      otEquipmentWipedCleanString = otEquipmentWipedCleanList[0];
      int length = otEquipmentWipedCleanList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          otEquipmentWipedCleanString += ', ' + otEquipmentWipedCleanList[i];
    }
  }

  String otNonAccessibleAreaSprayedWithDisinfectantString = '';
  List<String> otNonAccessibleAreaSprayedWithDisinfectantList = [];

  void otNonAccessibleAreaSprayedWithDisinfectantStringMaker() {
    if (value4corner)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('4 corners of upper ceiling');
    if (value2corner)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('2 corners of lower ceiling');
    if (value4cornerfloor)
      otNonAccessibleAreaSprayedWithDisinfectantList.add('4 corners of floor');
    if (valueAC) otNonAccessibleAreaSprayedWithDisinfectantList.add('AC');
    if (valuebottom)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('Intricate geometry area of OT table bottom');
    if (valuetrolleybottom)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('Intricate geometry area of instrument trolley bottom');
    if (valuetray)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('Intricate geometry area of additional storage tray');
    if (valueintristool)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('Intricate geometry area of additional stool');
    if (valueintrichair)
      otNonAccessibleAreaSprayedWithDisinfectantList
          .add('Intricate geometry area of surgeons chair');

    if (otEquipmentWipedCleanList.isNotEmpty) {
      otNonAccessibleAreaSprayedWithDisinfectantString =
          otNonAccessibleAreaSprayedWithDisinfectantList[0];
      int length = otNonAccessibleAreaSprayedWithDisinfectantList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          otNonAccessibleAreaSprayedWithDisinfectantString +=
              ', ' + otNonAccessibleAreaSprayedWithDisinfectantList[i];
    }
  }

  String otFumigationChemicalsString = '';
  List<String> otFumigationChemicalsList = [];

  void otFumigationChemicalsStringMaker() {
    if (valuebac) otFumigationChemicalsList.add('Bacilloid 20ml/1 ltr');
    if (valueinfect) otFumigationChemicalsList.add('Infecto Cide-N 20ml/1 ltr');

    if (otFumigationChemicalsList.isNotEmpty) {
      otFumigationChemicalsString = otFumigationChemicalsList[0];
      int length = otFumigationChemicalsList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          otFumigationChemicalsString += ', ' + otFumigationChemicalsList[i];
    }
  }

  String washroomChemicalForManualCleaningString = '';
  List<String> washroomChemicalForManualCleaningList = [];

  void washroomChemicalForManualCleaningStringMaker() {
    if (value20mlbac)
      washroomChemicalForManualCleaningList.add('Bacilloid 20ml/1 ltr');
    if (value20mlinfect)
      washroomChemicalForManualCleaningList.add('Infecto Cide-N 20ml/1 ltr');

    if (washroomChemicalForManualCleaningList.isNotEmpty) {
      washroomChemicalForManualCleaningString =
          washroomChemicalForManualCleaningList[0];
      int length = washroomChemicalForManualCleaningList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          washroomChemicalForManualCleaningString +=
              ', ' + washroomChemicalForManualCleaningList[i];
    }
  }

  String washroomAreaWipedCleanString = '';
  List<String> washroomAreaWipedCleanList = [];

  void washroomAreaWipedCleanStringMaker() {
    if (valuetiles)
      washroomAreaWipedCleanList.add('Tiles on sides of wash basin');
    if (valuegranite)
      washroomAreaWipedCleanList.add('Granite around wash basin');
    if (valueescape)
      washroomAreaWipedCleanList.add('Escape route window sill(granite)');
    if (valueotdoor) washroomAreaWipedCleanList.add('OT door wall & door');
    if (valueexit) washroomAreaWipedCleanList.add('Exit door to passage');
    if (valuewooden) washroomAreaWipedCleanList.add('Wooden bench');
    if (valueFan) washroomAreaWipedCleanList.add('Fan');
    if (valueouterarea)
      washroomAreaWipedCleanList.add('Storage trolley outer area');
    if (valueinsidedrawer)
      washroomAreaWipedCleanList.add('Storage trolley inside drawers');
    if (valueaC) washroomAreaWipedCleanList.add('AC');
    if (valueFloor) washroomAreaWipedCleanList.add('Floor');
    if (valuefumigation) washroomAreaWipedCleanList.add('Fumigation machine');
    if (valuemedicine)
      washroomAreaWipedCleanList
          .add('Various medicines & chemicals bottles outer side');

    if (washroomAreaWipedCleanList.isNotEmpty) {
      washroomAreaWipedCleanString = washroomAreaWipedCleanList[0];
      int length = washroomAreaWipedCleanList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          washroomAreaWipedCleanString += ', ' + washroomAreaWipedCleanList[i];
    }
  }

  String washroomNonAccessibleAreaSprayedWithDisinfectantString = '';
  List<String> washroomNonAccessibleAreaSprayedWithDisinfectantList = [];

  void washroomNonAccessibleAreaSprayedWithDisinfectantStringMaker() {
    if (value4cornerupper)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('4 corners of upper ceiling');
    if (value4corneroffloor)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('4 corners of floor');
    if (value4cornerescape)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('4 corners of escape route');
    if (valuewashbasin)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('Underneath wash basin');
    if (valuewatertap)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('Non-accessable area of water tap');
    if (valuepurifier)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('Behind water purifier');
    if (valueunderneathbench)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('Underneath wooden bench');
    if (valueunderneathtrolley)
      washroomNonAccessibleAreaSprayedWithDisinfectantList
          .add('Underneath storage trolley');

    if (washroomNonAccessibleAreaSprayedWithDisinfectantList.isNotEmpty) {
      washroomNonAccessibleAreaSprayedWithDisinfectantString =
          washroomNonAccessibleAreaSprayedWithDisinfectantList[0];
      int length = washroomNonAccessibleAreaSprayedWithDisinfectantList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          washroomNonAccessibleAreaSprayedWithDisinfectantString +=
              ', ' + washroomNonAccessibleAreaSprayedWithDisinfectantList[i];
    }
  }

  String washroomChemicalForFumigationString = '';
  List<String> washroomChemicalForFumigationList = [];

  void washroomChemicalForFumigationStringMaker() {
    if (valuechembac)
      washroomChemicalForFumigationList.add('Bacilloid 20ml/1 ltr');
    if (valuecheminfect)
      washroomChemicalForFumigationList.add('Infecto Cide-N 20ml/1 ltr');

    if (washroomChemicalForFumigationList.isNotEmpty) {
      washroomChemicalForFumigationString =
          washroomChemicalForFumigationList[0];
      int length = washroomChemicalForFumigationList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          washroomChemicalForFumigationString +=
              ', ' + washroomChemicalForFumigationList[i];
    }
  }

  String swabSampleLocationsString = '';
  List<String> swabSampleLocationsList = [];

  void swabSampleLocationsStringMaker() {
    if (valueOPD) swabSampleLocationsList.add('OPD wall');
    if (valueDead) swabSampleLocationsList.add('Dead wall');
    if (valueDoorside) swabSampleLocationsList.add('Door wall & door');
    if (valuePassageWall) swabSampleLocationsList.add('Passage wall');
    if (valueACWall) swabSampleLocationsList.add('AC wall');
    if (valueLowerCeiling) swabSampleLocationsList.add('Lower ceiling');
    if (valueUpperCeiling) swabSampleLocationsList.add('Upper ceiling');
    if (valueStand) swabSampleLocationsList.add('Microscope head');
    if (valueLegs) swabSampleLocationsList.add('OT table');
    if (valueInstrument) swabSampleLocationsList.add('Instrument trolley');
    if (valueaircondition) swabSampleLocationsList.add('AC');
    if (valueair) swabSampleLocationsList.add('Air');
    if (valueplate) swabSampleLocationsList.add('Culture plate');
    if (valuebelow)
      swabSampleLocationsList.add('Wash room-specify location in Other  below');

    if (swabSampleLocationsList.isNotEmpty) {
      swabSampleLocationsString = swabSampleLocationsList[0];
      int length = swabSampleLocationsList.length;
      if (length > 1)
        for (int i = 1; i < length; i++)
          swabSampleLocationsString += ', ' + swabSampleLocationsList[i];
    }
  }

  void addData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('otregister');

    //String makers fun

    collectionReference.add({
      //OT details
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Operation Theatre',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 20),
              //   child: Text(
              //     '',
              //     style: GoogleFonts.lato(
              //       textStyle: TextStyle(
              //         fontSize: 30.0,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
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
                              dateLabelText: 'OT-date of manual cleaning',
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
                                return val.isNotEmpty ? null : "Enter Time";
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'OT manual cleaning started at',
                                labelStyle: TextStyle(
                                  height: 1.2,
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
                                return val.isNotEmpty ? null : "Enter Time";
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'OT manual cleaning completed at',
                                labelStyle: TextStyle(
                                  height: 1.2,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OT-Disinfectant(s) used for manual cleaning?',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CheckboxListTile(
                                  title: Text(
                                      'Bacilloid solution 20ml/1 ltr water'),
                                  value: this.valuebaci,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuebaci = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title:
                                      Text('Infecto-Cide N 20 ml/1 ltr water'),
                                  value: this.valueinfecto,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueinfecto = value;
                                      if (valueinfecto == true) {
                                        infecto =
                                            "Infecto-Cide N 20 ml/1 ltr water";
                                      }
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    validator: (val) {
                                      return val.isNotEmpty
                                          ? null
                                          : "Enter text";
                                    },
                                    //
                                    onChanged: (val) {
                                      pName = val;
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: 'Others ',
                                      labelStyle: TextStyle(
                                        height: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OT area wiped clean',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                CheckboxListTile(
                                  title: Text('OPD Wall'),
                                  value: this.valueopdwall,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueopdwall = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Dead Wall'),
                                  value: this.valuedeadwall,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuedeadwall = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Door side wall & door'),
                                  value: this.valueside,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueside = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Passage wall'),
                                  value: this.valuepassage,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuepassage = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('AC wall'),
                                  value: this.valueac,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueac = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Lower ceiling'),
                                  value: this.valuelower,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuelower = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Upper ceiling'),
                                  value: this.valueupper,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueupper = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pName = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Others ',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OT Equipment wiped clean',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                CheckboxListTile(
                                  title: Text('Microscope Stand'),
                                  value: this.valuemicroscope,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuemicroscope = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('OT table, including legs'),
                                  value: this.valuetable,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuetable = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Instrument trolley'),
                                  value: this.valuetrolley,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuetrolley = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Surgeons chair'),
                                  value: this.valuechair,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuechair = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Additional storage trolley'),
                                  value: this.valueaddtrolley,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueaddtrolley = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Additional stool'),
                                  value: this.valuestool,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuestool = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pName = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Others ',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'OT-Non accessible area sprayed with disinfectant',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              CheckboxListTile(
                                title: Text('4 corners of upper ceiling'),
                                value: this.value4corner,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value4corner = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('2 corners of lower ceiling'),
                                value: this.value2corner,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value2corner = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('4 corners of floor'),
                                value: this.value4cornerfloor,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value4cornerfloor = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('AC'),
                                value: this.valueAC,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valueAC = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of OT table bottom'),
                                value: this.valuebottom,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuebottom = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of instrument trolley bottom'),
                                value: this.valuetrolleybottom,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuetrolleybottom = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of additional storage tray'),
                                value: this.valuetray,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuetray = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of additional stool'),
                                value: this.valueintristool,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valueintristool = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of surgeons chair'),
                                value: this.valueintrichair,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valueintrichair = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                validator: (val) {
                                  return val.isNotEmpty ? null : "Enter text";
                                },
                                //
                                onChanged: (val) {
                                  pName = val;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Others ',
                                  labelStyle: TextStyle(
                                    height: 1.2,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DateTimePicker(
                                initialValue: '',
                                type: DateTimePickerType.date,
                                dateLabelText: 'OT fumigation date',
                                firstDate: DateTime(1995),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
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
                                  return val.isNotEmpty ? null : "Enter Time";
                                },
                                onChanged: (val) {
                                  pNumber = val;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'OT Fumigation started',
                                  labelStyle: TextStyle(
                                    height: 1.2,
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
                                  return val.isNotEmpty ? null : "Enter Time";
                                },
                                onChanged: (val) {
                                  pNumber = val;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'OT Fumigation completed',
                                  labelStyle: TextStyle(
                                    height: 1.2,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OT fumigation-chemical(s) used',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                CheckboxListTile(
                                  title: Text('Bacilloid 20ml/1 ltr'),
                                  value: this.valuebac,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuebac = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Infecto Cide-N 20ml/1 ltr'),
                                  value: this.valueinfect,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valueinfect = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  //

                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Others ',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Washroom',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                DateTimePicker(
                                  initialValue: '',
                                  type: DateTimePickerType.date,
                                  dateLabelText:
                                      'Washroom manual cleaning date',
                                  firstDate: DateTime(1995),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 365)),
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
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pName = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Wash room manual cleaning started at',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pName = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Wash room manual cleaning completed',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Washroom-chemical used for manual cleaning',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                CheckboxListTile(
                                  title: Text('Bacilloid 20ml/1 ltr'),
                                  value: this.value20mlbac,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value20mlbac = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Infecto Cide-N 20ml/1 ltr'),
                                  value: this.value20mlinfect,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value20mlinfect = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pName = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'Others ',
                                    labelStyle: TextStyle(
                                      height: 1.2,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Washroom-area, equipment & furniture wiped clean',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CheckboxListTile(
                                    title: Text('Tiles on sides of wash basin'),
                                    value: this.valuetiles,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valuetiles = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Granite around wash basin'),
                                    value: this.valuegranite,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valuegranite = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                        'Escape route window sill(granite)'),
                                    value: this.valueescape,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueescape = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('OT door wall & door'),
                                    value: this.valueotdoor,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueotdoor = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Exit door to passage'),
                                    value: this.valueexit,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueexit = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Wooden bench'),
                                    value: this.valuewooden,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valuewooden = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Fan'),
                                    value: this.valueFan,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueFan = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Storage trolley outer area'),
                                    value: this.valueouterarea,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueouterarea = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title:
                                        Text('Storage trolley inside drawers'),
                                    value: this.valueinsidedrawer,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueinsidedrawer = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('AC'),
                                    value: this.valueaC,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueaC = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Floor'),
                                    value: this.valueFloor,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valueFloor = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Fumigation machine'),
                                    value: this.valuefumigation,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valuefumigation = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                        'Various medicines & chemicals bottles outer side'),
                                    value: this.valuemedicine,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.valuemedicine = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      return val.isNotEmpty
                                          ? null
                                          : "Enter text";
                                    },
                                    //
                                    onChanged: (val) {
                                      pName = val;
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: 'Others ',
                                      labelStyle: TextStyle(
                                        height: 1.2,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Washroom-Non accessible area sprayed with disinfectant',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CheckboxListTile(
                                      title: Text('4 corners of upper ceiling'),
                                      value: this.value4cornerupper,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value4cornerupper = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('4 corners of floor'),
                                      value: this.value4corneroffloor,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value4corneroffloor = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('4 corners of escape route'),
                                      value: this.value4cornerescape,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value4cornerescape = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath wash basin'),
                                      value: this.valuewashbasin,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.valuewashbasin = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text(
                                          'Non-accessable area of water tap'),
                                      value: this.valuewatertap,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.valuewatertap = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Behind water purifier'),
                                      value: this.valuepurifier,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.valuepurifier = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath wooden bench'),
                                      value: this.valueunderneathbench,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.valueunderneathbench = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath storage trolley'),
                                      value: this.valueunderneathtrolley,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.valueunderneathtrolley = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "Enter text";
                                      },
                                      //
                                      onChanged: (val) {
                                        pName = val;
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText: 'Others ',
                                        labelStyle: TextStyle(
                                          height: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    DateTimePicker(
                                      initialValue: '',
                                      type: DateTimePickerType.date,
                                      dateLabelText:
                                          'Wash room fumigation date',
                                      firstDate: DateTime(1995),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 365)),
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
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "Enter text";
                                      },
                                      //
                                      onChanged: (val) {
                                        pName = val;
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Washroom fumigation started',
                                        labelStyle: TextStyle(
                                          height: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "Enter text";
                                      },
                                      //
                                      onChanged: (val) {
                                        pName = val;
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Wash room fumigation completed',
                                        labelStyle: TextStyle(
                                          height: 1.2,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Washroom-chemical used for fumigation',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      CheckboxListTile(
                                        title: Text('Bacilloid 20ml/1 ltr'),
                                        value: this.valuechembac,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.valuechembac = value;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title:
                                            Text('Infecto Cide-N 20ml/1 ltr'),
                                        value: this.valuecheminfect,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.valuecheminfect = value;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      TextFormField(
                                        validator: (val) {
                                          return val.isNotEmpty
                                              ? null
                                              : "Enter text";
                                        },
                                        //
                                        onChanged: (val) {
                                          pName = val;
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: 'Other',
                                          labelStyle: TextStyle(
                                            height: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Column(
                                        children: [
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              labelText: 'Notes',
                                              labelStyle: TextStyle(
                                                height: 1.2,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Swab Details',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      DateTimePicker(
                                        initialValue: '',
                                        type: DateTimePickerType.date,
                                        dateLabelText: 'Swab taken on',
                                        firstDate: DateTime(1995),
                                        lastDate: DateTime.now()
                                            .add(Duration(days: 365)),
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
                                        height: 10.0,
                                      ),
                                      TextFormField(
                                        validator: (val) {
                                          return val.isNotEmpty
                                              ? null
                                              : "Enter text";
                                        },
                                        //
                                        onChanged: (val) {
                                          pName = val;
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: 'Swab taken time ',
                                          labelStyle: TextStyle(
                                            height: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Swab sample locations',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        CheckboxListTile(
                                          title: Text('OPD wall'),
                                          value: this.valueOPD,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueOPD = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Dead wall'),
                                          value: this.valueDead,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueDead = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Door wall & door'),
                                          value: this.valueDoorside,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueDoorside = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Passage wall'),
                                          value: this.valuePassageWall,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valuePassageWall = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('AC wall'),
                                          value: this.valueACWall,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueACWall = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Lower ceiling'),
                                          value: this.valueLowerCeiling,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueLowerCeiling = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Upper ceiling'),
                                          value: this.valueUpperCeiling,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueUpperCeiling = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Microscope head'),
                                          value: this.valueStand,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueStand = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('OT table'),
                                          value: this.valueLegs,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueLegs = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Instrument trolley'),
                                          value: this.valueInstrument,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueInstrument = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('AC'),
                                          value: this.valueaircondition,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueaircondition = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Air'),
                                          value: this.valueair,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueair = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Culture plate'),
                                          value: this.valueplate,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueplate = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text(
                                              'Wash room-specify location in Other  below'),
                                          value: this.valuebelow,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valuebelow = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          validator: (val) {
                                            return val.isNotEmpty
                                                ? null
                                                : "Enter text";
                                          },
                                          //
                                          onChanged: (val) {
                                            pName = val;
                                            setState(() {});
                                          },
                                          keyboardType: TextInputType.name,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            labelText: ' Other',
                                            labelStyle: TextStyle(
                                              height: 1.2,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        DateTimePicker(
                                          initialValue: '',
                                          type: DateTimePickerType.date,
                                          dateLabelText: 'Swab result date',
                                          firstDate: DateTime(1995),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)),
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
                                        SizedBox(height: 5),
                                        Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'Swab results'
                                                  'Mark only one circle',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                  value: 'Yes',
                                                  groupValue: swabResults,
                                                  onChanged: (val) {
                                                    swabResults = val;
                                                    setState(() {});
                                                  }),
                                              Flexible(
                                                  child: Text(
                                                      'Negative/acceptable for surgeries')),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                  value: 'No',
                                                  groupValue: swabResults,
                                                  onChanged: (val) {
                                                    swabResults = val;
                                                    setState(() {});
                                                  }),
                                              Text(
                                                  'Positive: Clean/refumigate as required.\n See test report for details'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            validator: (val) {
                                              return val.isNotEmpty
                                                  ? null
                                                  : "Enter text";
                                            },
                                            //
                                            onChanged: (val) {
                                              pName = val;
                                              setState(() {});
                                            },
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              labelText:
                                                  ' OT/wash room swab & other test results'
                                                  'Files submitted:',
                                              labelStyle: TextStyle(
                                                height: 1.2,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 31.0,
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 100.0),
                                                child: Container(
                                                  height: 40.0,
                                                  child: Material(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    shadowColor: Colors
                                                        .greenAccent
                                                        .withOpacity(0.8),
                                                    elevation: 5.0,
                                                    child: Center(
                                                      child: Text(
                                                        'Submit',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),

                                          // Container(
                                          //   child: ElevatedButton(
                                          //     child: Text('submit'),
                                          //     onPressed: () async {
                                          //       // print(_selectedDate);
                                          //
                                          //       if (formKey.currentState.validate()) {
                                          //         await collectionReference.add({
                                          //           'patient Name': pName,
                                          //           'phone number': pNumber,
                                          //           'date': _selectedDate,
                                          //           'address': pAddress,
                                          //           'fee details': _feeDetails,
                                          //           'fee collected': _feeAmount,
                                          //           'body temp': pTemp,
                                          //           'flu symptoms': _flu,
                                          //           'first visit': _firstTime,
                                          //           'other expenses': _otherExpenses,
                                          //           'other': _other,
                                          //           'notes': _notes,
                                          //         }).then((value) {
                                          //           currentid = value.id;
                                          //           print(value.id);
                                          //         });
                                          //         Navigator.pop(context);
                                          //       }
                                          //     },
                                          //   ),
                                          // ),
                                        ]),
                                      ]),
                                    ]),
                                  ]),
                                ]),
                              ])
                            ])
                          ])))
            ],
          ),
        ),
      ),
    );
  }
}
