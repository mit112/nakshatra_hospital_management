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
  String _flu, _firstTime, _feeDetails, _otherExpenses, _feeAmount;
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
      value41 = false,
      value42 = false,
      value43 = false,
      value44 = false,
      value45 = false,
      value46 = false,
      value47 = false,
      value48 = false,
      value49 = false,
      value50 = false,
      value51 = false,
      value52 = false,
      value53 = false,
      value54 = false,
      value55 = false,
      value56 = false,
      value57 = false,
      value58 = false,
      value59 = false,
      value60 = false,
      value61 = false,
      value62 = false,
      value63 = false,
      value64 = false,
      value65 = false,
      value66 = false,
      value67 = false,
      value68 = false,
      value69 = false,
      value70 = false,
      value71 = false,
      value72 = false;

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
                                      this.valueaddtrolley= value;
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
                                value: this.valuebottom ,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuebottom  = value;
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
                                    value: this.value41,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value41 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Fan'),
                                    value: this.value42,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value42 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Storage trolley outer area'),
                                    value: this.value43,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value43 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title:
                                        Text('Storage trolley inside drawers'),
                                    value: this.value44,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value44 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('AC'),
                                    value: this.value45,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value45 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Floor'),
                                    value: this.value46,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value46 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Fumigation machine'),
                                    value: this.value47,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value47 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                        'Various medicines & chemicals bottles outer side'),
                                    value: this.value48,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value48 = value;
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
                                      value: this.value49,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value49 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('4 corners of floor'),
                                      value: this.value50,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value50 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('4 corners of escape route'),
                                      value: this.value51,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value51 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath wash basin'),
                                      value: this.value52,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value52 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text(
                                          'Non-accessable area of water tap'),
                                      value: this.value53,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value53 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Behind water purifier'),
                                      value: this.value54,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value54 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath wooden bench'),
                                      value: this.value55,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value55 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Underneath storage trolley'),
                                      value: this.value56,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value56 = value;
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
                                            'Washroom-chemical used for manual cleaning',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      CheckboxListTile(
                                        title: Text('Bacilloid 20ml/1 ltr'),
                                        value: this.value57,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.value57 = value;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title:
                                            Text('Infecto Cide-N 20ml/1 ltr'),
                                        value: this.value58,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.value58 = value;
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
                                          value: this.value59,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value59 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Dead wall'),
                                          value: this.value60,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value60 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Door wall & door'),
                                          value: this.value61,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value61 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Passage wall'),
                                          value: this.value62,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value62 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('AC wall'),
                                          value: this.value63,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value63 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Lower ceiling'),
                                          value: this.value64,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value64 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Upper ceiling'),
                                          value: this.value65,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value65 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Microscope head'),
                                          value: this.value66,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value66 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('OT table'),
                                          value: this.value67,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value67 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Instrument trolley'),
                                          value: this.value68,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value68 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('AC'),
                                          value: this.value69,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value69 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Air'),
                                          value: this.value70,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value70 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text('Culture plate'),
                                          value: this.value71,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value71 = value;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: Text(
                                              'Wash room-specify location in Other  below'),
                                          value: this.value72,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value72 = value;
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
                                                  groupValue: _firstTime,
                                                  onChanged: (val) {
                                                    _firstTime = val;
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
                                                  groupValue: _firstTime,
                                                  onChanged: (val) {
                                                    _firstTime = val;
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
