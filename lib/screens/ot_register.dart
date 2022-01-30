import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';
import 'homepage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ot_register extends StatefulWidget {
  @override
  _ot_registerState createState() => _ot_registerState();
}

class _ot_registerState extends State<ot_register> {
  final formKey = GlobalKey<FormState>();
  String swabResults;
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  String pTemp,
      pNumber,
      pAddress,
      pOTDisinfectant,
      pOTarea,
      pOTEquipment,
      pOTNonaccessible,
      pOTfumigation,
      pWashroom,
      pWashroom_area,
      pWashroomNon_accessible,
      pWashroom_chemical,
      pSwab_sample,
      pSwab_result,
      pManual_started,
      pManual_completed,
      pFumigation_started,
      pFumigation_completed,
      pWashroom_started,
      pWashroom_completed,
      pWfumigation_started,
      pWfumigation_completed,
      pSwab_takentime,
      notes;
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

  //Todo: Something
  String fileName;
  File file;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(
    pOTDisinfectant == null ||
     pOTarea == null ||
     pOTEquipment== null ||
     pOTNonaccessible== null ||
   pOTfumigation== null ||
    pWashroom== null ||
     pWashroom_area== null ||
     pWashroomNon_accessible== null ||
     pWashroom_chemical== null ||
     pSwab_sample== null ||
    pSwab_result== null )
    {
          pOTDisinfectant = "Not Answered";
          pOTarea = "Not Answered";
          pOTEquipment = "Not Answered";
          pOTNonaccessible = "Not Answered";
          pOTfumigation = "Not Answered";
          pWashroom = "Not Answered";
          pWashroom_area = "Not Answered";
          pWashroomNon_accessible = "Not Answered";
          pWashroom_chemical = "Not Answered";
          pSwab_sample = "Not Answered";
          pSwab_result = "Not Answered";
    }
  }
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

  //Todo: Add file stuff
  Future<void> uploadFile(String uuid) async {
    try {
      //String fileExtension = file.path.split('.').last;
      fileName = 'ot'
          '/${uuid}';

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

//ADD FORM TO THE DATABASE
  void addOTData() async {
    if (formKey.currentState.validate()) {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('otregister');

      String docuName;
      var uuid = Uuid();
      docuName = uuid.v1();
      await uploadFile(docuName);

      //String makers fun
      disinfectantsForManualCleaningStringMaker();
      otAreaWipedCleanStringMaker();
      otEquipmentWipedCleanStringMaker();
      otFumigationChemicalsStringMaker();
      otNonAccessibleAreaSprayedWithDisinfectantStringMaker();
      swabSampleLocationsStringMaker();
      washroomAreaWipedCleanStringMaker();
      washroomChemicalForManualCleaningStringMaker();
      washroomChemicalForFumigationStringMaker();
      washroomNonAccessibleAreaSprayedWithDisinfectantStringMaker();

      await collectionReference.doc(docuName).set({
        //OT details
        'ot id': docuName,
        'file name': fileName,
        'date': _selectedDate,
        'manual cleaning start': pManual_started,
        'manual cleaning end': pManual_completed,
        'disinfectant for manual cleaning':
            disinfectantsForManualCleaningString,
        'Other Disinfectant': pOTDisinfectant,
        'ot area wiped clean': otAreaWipedCleanString,
        'Other Area': pOTarea,
        'ot equipment wiped clean': otEquipmentWipedCleanString,
        'Other Equipment': pOTEquipment,
        'non accessible area sprayed with disinfectant':
            otNonAccessibleAreaSprayedWithDisinfectantString,
        'Other Non-accessible Area': pOTNonaccessible,
        'ot fumigation date': _selectedDate,
        'ot fumigation started': pFumigation_started,
        'ot fumigation completed': pFumigation_completed,
        'ot fumigation chemicals used': otFumigationChemicalsString,
        'Other fumigation Chemical': pOTfumigation,
        'washroom manual cleaning date': _selectedDate,
        'washroom manual cleaning started': pWashroom_started,
        'washroom manual cleaning ended': pWashroom_completed,
        'washroom-chemical used for manual cleaning':
            washroomChemicalForManualCleaningString,
        'Other Chemical': pWashroom,
        'washroom area furniture wiped clean': washroomAreaWipedCleanString,
        'Other Washroom Area': pWashroom_area,
        'washroom non accessible area sprayed':
            washroomNonAccessibleAreaSprayedWithDisinfectantString,
        'Other Washroom non-accessible': pWashroomNon_accessible,
        'washroom fumigation date': _selectedDate,
        'washroom fumigation started': pWfumigation_started,
        'washroom fumigation ended': pWfumigation_completed,
        'washroom chemicals used for fumigation':
            washroomChemicalForFumigationString,
        'Other Washroom Chemicals': pWashroom_chemical,
        'notes': notes,
        'swab taken on': _selectedDate,
        'swab taken time': pSwab_takentime,
        'swab sample locations': swabSampleLocationsList,
        'Other Swab Sample': pSwab_sample,
        'swab result date': _selectedDate,
        'swab results': swabResults,
        'Other tests': pSwab_result,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        leading: GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (ctx) => Alert());
          },
          child: Icon(Icons.arrow_back // add custom icons also
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
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                      key: formKey,
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.green[200],
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                DateTimePicker(
                                  initialValue: '',
                                  type: DateTimePickerType.date,
                                  textInputAction: TextInputAction.next,
                                  dateLabelText: ' OT-date of manual cleaning',
                                  firstDate: DateTime(1995),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 365)),
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter Time";
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.grey[100].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextFormField(
                              validator: (val) {
                                return val.isNotEmpty ? null : "Enter Time";
                              },
                              onChanged: (val) {
                                pManual_started = val;
                                setState(() {});
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'OT manual cleaning started at',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.green[200],
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter Time";
                                  },
                                  onChanged: (val) {
                                    pManual_completed = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText:
                                        ' OT manual cleaning completed at',                                   
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        //OT-Disinfectant(s) used for manual cleaning?
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.grey[100].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),                           
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'OT-Disinfectant(s) used for manual cleaning?',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w400,
                                        ),
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

                                    onChanged: (val) {
                                      pOTDisinfectant = val;
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
                          ),
                        ),
                        SizedBox(height: 20),
                        //OT area wiped clean
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              //background color of box
                              BoxShadow(
                                color: Colors.green[200],
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
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

                                  onChanged: (val) {
                                    pOTarea = val;
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
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //OT Equipment wiped clean
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.grey[400].withOpacity(0.5),
                            color: Colors.grey[100].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            // boxShadow: [
                            //background color of box
                            // BoxShadow(
                            //   color: Colors.white70,
                            //   offset: Offset(
                            //     2.0, // Move to right 10  horizontally
                            //     2.0, // Move to bottom 10 Vertically
                            //   ),
                            // )
                            // ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
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
                                  onChanged: (val) {
                                    pOTEquipment = val;
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
                          ),
                        ),
                        SizedBox(height: 20),
                        //OT-Non accessible area sprayed with disinfectant AND SO ON
                        Column(children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey[400].withOpacity(0.5),
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: Colors.green[200],
                                  offset: Offset(
                                    2.0, // Move to right 10  horizontally
                                    2.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'OT-Non accessible area sprayed with disinfectant',
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
                                    onChanged: (val) {
                                      pOTNonaccessible = val;
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
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey[400].withOpacity(0.5),
                              color: Colors.grey[100].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              // boxShadow: [
                              //background color of box
                              // BoxShadow(
                              //   color: Colors.white70,
                              //   offset: Offset(
                              //     2.0, // Move to right 10  horizontally
                              //     2.0, // Move to bottom 10 Vertically
                              //   ),
                              // )
                              // ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DateTimePicker(
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
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey[400].withOpacity(0.5),
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: Colors.green[200],
                                  offset: Offset(
                                    2.0, // Move to right 10  horizontally
                                    2.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                validator: (val) {
                                  return val.isNotEmpty ? null : "Enter Time";
                                },
                                onChanged: (val) {
                                  pFumigation_started = val;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'OT Fumigation started',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey[400].withOpacity(0.5),
                              color: Colors.grey[100].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                validator: (val) {
                                  return val.isNotEmpty ? null : "Enter Time";
                                },
                                onChanged: (val) {
                                  pFumigation_completed = val;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'OT Fumigation completed',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.green[200],
                                    offset: Offset(
                                      2.0, // Move to right 10  horizontally
                                      2.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      onChanged: (val) {
                                        pOTfumigation = val;
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
                              ),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Washroom',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.green[200],
                                    offset: Offset(
                                      2.0, // Move to right 10  horizontally
                                      2.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: DateTimePicker(
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
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pWashroom_started = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Wash room manual cleaning started at',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Colors.green[200],
                                    offset: Offset(
                                      2.0, // Move to right 10  horizontally
                                      2.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  validator: (val) {
                                    return val.isNotEmpty ? null : "Enter text";
                                  },
                                  //
                                  onChanged: (val) {
                                    pWashroom_completed = val;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Wash room manual cleaning completed',
                                    // labelStyle: TextStyle(
                                    //   height: 1.2,
                                    //   fontStyle: FontStyle.italic,
                                    //   fontSize: 18.0,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.grey[400].withOpacity(0.5),
                                color: Colors.grey[100].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                                // boxShadow: [
                                //background color of box
                                // BoxShadow(
                                //   color: Colors.white70,
                                //   offset: Offset(
                                //     2.0, // Move to right 10  horizontally
                                //     2.0, // Move to bottom 10 Vertically
                                //   ),
                                // )
                                // ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Washroom-chemical used for manual cleaning',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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

                                    onChanged: (val) {
                                      pWashroom = val;
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
                                ]),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.grey[400].withOpacity(0.5),
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    //background color of box
                                    BoxShadow(
                                      color: Colors.green[200],
                                      offset: Offset(
                                        2.0,
                                        // Move to right 10  horizontally
                                        2.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        title: Text(
                                            'Tiles on sides of wash basin'),
                                        value: this.valuetiles,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.valuetiles = value;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title:
                                            Text('Granite around wash basin'),
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
                                        title:
                                            Text('Storage trolley outer area'),
                                        value: this.valueouterarea,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.valueouterarea = value;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            'Storage trolley inside drawers'),
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

                                        onChanged: (val) {
                                          pWashroom_area = val;
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
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey[400].withOpacity(0.5),
                                    color: Colors.grey[100].withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                    // boxShadow: [
                                    //background color of box
                                    // BoxShadow(
                                    //   color: Colors.white70,
                                    //   offset: Offset(
                                    //     2.0, // Move to right 10  horizontally
                                    //     2.0, // Move to bottom 10 Vertically
                                    //   ),
                                    // )
                                    // ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
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
                                          title: Text(
                                              '4 corners of upper ceiling'),
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
                                          title:
                                              Text('4 corners of escape route'),
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
                                          title:
                                              Text('Underneath wooden bench'),
                                          value: this.valueunderneathbench,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueunderneathbench = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text(
                                              'Underneath storage trolley'),
                                          value: this.valueunderneathtrolley,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.valueunderneathtrolley =
                                                  value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(

                                          onChanged: (val) {
                                            pWashroomNon_accessible = val;
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
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey[400].withOpacity(0.5),
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.green[200],
                                        offset: Offset(
                                          2.0,
                                          // Move to right 10  horizontally
                                          2.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DateTimePicker(
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
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey[400].withOpacity(0.5),
                                    color: Colors.grey[100].withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                    // boxShadow: [
                                    //background color of box
                                    // BoxShadow(
                                    //   color: Colors.white70,
                                    //   offset: Offset(
                                    //     2.0, // Move to right 10  horizontally
                                    //     2.0, // Move to bottom 10 Vertically
                                    //   ),
                                    // )
                                    // ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextFormField(
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "Enter text";
                                      },
                                      //
                                      onChanged: (val) {
                                        pWfumigation_started = val;
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Washroom fumigation started',
                                        // labelStyle: TextStyle(
                                        //   height: 1.2,
                                        //   fontStyle: FontStyle.italic,
                                        //   fontSize: 18.0,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey[400].withOpacity(0.5),
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color: Colors.green[200],
                                        offset: Offset(
                                          2.0,
                                          // Move to right 10  horizontally
                                          2.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextFormField(
                                      validator: (val) {
                                        return val.isNotEmpty
                                            ? null
                                            : "Enter text";
                                      },
                                      //
                                      onChanged: (val) {
                                        pWfumigation_completed = val;
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Wash room fumigation completed',
                                        // labelStyle: TextStyle(
                                        //   height: 1.2,
                                        //   fontStyle: FontStyle.italic,
                                        //   fontSize: 18.0,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[400].withOpacity(0.5),
                                      color: Colors.grey[100].withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
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
                                            title: Text(
                                                'Infecto Cide-N 20ml/1 ltr'),
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
                                           
                                            onChanged: (val) {
                                              pWashroom_chemical = val;
                                              setState(() {});
                                            },
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              labelText: 'Other',
                                              labelStyle: TextStyle(
                                                height: 1.2,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.grey[400].withOpacity(0.5),
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.green[200],
                                              offset: Offset(
                                                2.0,
                                                // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                validator: (val) {
                                                  return val.isNotEmpty
                                                      ? null
                                                      : "Enter text";
                                                },
                                                onChanged: (val) {
                                                  notes = val;
                                                  setState(() {});
                                                },
                                                keyboardType:
                                                    TextInputType.text,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Swab Details',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[400].withOpacity(0.5),
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        //background color of box
                                        BoxShadow(
                                          color: Colors.green[200],
                                          offset: Offset(
                                            2.0,
                                            // Move to right 10  horizontally
                                            2.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: DateTimePicker(
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
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[400].withOpacity(0.5),
                                      color: Colors.grey[100].withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                      // boxShadow: [
                                      //background color of box
                                      // BoxShadow(
                                      //   color: Colors.white70,
                                      //   offset: Offset(
                                      //     2.0, // Move to right 10  horizontally
                                      //     2.0, // Move to bottom 10 Vertically
                                      //   ),
                                      // )
                                      // ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: TextFormField(
                                        validator: (val) {
                                          return val.isNotEmpty
                                              ? null
                                              : "Enter text";
                                        },
                                        //
                                        onChanged: (val) {
                                          pSwab_takentime = val;
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: 'Swab taken time ',
                                          // labelStyle: TextStyle(
                                          //   height: 1.2,
                                          //   fontStyle: FontStyle.italic,
                                          //   fontSize: 18.0,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[400].withOpacity(0.5),
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          //background color of box
                                          BoxShadow(
                                            color: Colors.green[200],
                                            offset: Offset(
                                              2.0,
                                              // Move to right 10  horizontally
                                              2.0, // Move to bottom 10 Vertically
                                            ),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
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
                                                  this.valueLowerCeiling =
                                                      value;
                                                });
                                              },
                                            ),
                                            CheckboxListTile(
                                              title: Text('Upper ceiling'),
                                              value: this.valueUpperCeiling,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  this.valueUpperCeiling =
                                                      value;
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
                                                  this.valueaircondition =
                                                      value;
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

                                              onChanged: (val) {
                                                pSwab_sample = val;
                                                setState(() {});
                                              },
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                labelText: ' Other',
                                                labelStyle: TextStyle(
                                                  height: 1.2,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[400].withOpacity(0.5),
                                        color:
                                            Colors.grey[100].withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(16),
                                        // boxShadow: [
                                        //background color of box
                                        // BoxShadow(
                                        //   color: Colors.white70,
                                        //   offset: Offset(
                                        //     2.0, // Move to right 10  horizontally
                                        //     2.0, // Move to bottom 10 Vertically
                                        //   ),
                                        // )
                                        // ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
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
                                            SizedBox(height: 30),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 20),
                                                    Flexible(
                                                      child: Text(
                                                        'Swab results- '
                                                        'Mark only one circle',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.grey[400].withOpacity(0.5),
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.green[200],
                                              offset: Offset(
                                                2.0,
                                                // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            validator: (val) {
                                              return val.isNotEmpty
                                                  ? null
                                                  : "Enter text";
                                            },
                                            //
                                            onChanged: (val) {
                                              pSwab_result = val;
                                              setState(() {});
                                            },
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              labelText:
                                                  ' Test results',
                                                 //'Files submitted:',
                                              labelStyle: TextStyle(
                                                height: 1.2,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 60.0),
                                            child: Container(
                                              height: 40.0,
                                              child: Material(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                shadowColor: Colors.greenAccent
                                                    .withOpacity(0.8),
                                                elevation: 7.0,
                                                child: GestureDetector(
                                                  onTap: selectFile,
                                                  child: Center(
                                                    child: Text(
                                                      'Upload Files',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Column(
                                        children: [
                                          BouncingWidget(
                                            scaleFactor: _scaleFactor,
                                            stayOnBottom: stayOnBottom,
                                            onPressed: addOTData,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 60.0),
                                                  child: Container(
                                                    height: 48.0,
                                                    child: Material(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      shadowColor: Colors
                                                          .greenAccent
                                                          .withOpacity(0.8),
                                                      elevation: 7.0,
                                                      child: Center(
                                                        child: Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                            height: 30,
                                          ),
                                        ],
                                      ),
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

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert Dialog Box"),
      content: Text("Arey you sure you want to exit form"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Text("Yes"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "No",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
