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

  bool value = false,value2 = false,value3 = false,value4 = false,
      value5 = false,
      value6 = false,
      value7 = false,
      value8 = false,
      value9 = false,
      value10 = false,
      value11 = false,
      value12 = false,
      value13 = false,
      value14 = false,
      value15 = false,
      value16 = false,
      value17 = false,
      value18 = false,
      value19 = false,
      value20 = false,
      value21 = false,
      value22 = false,
      value23 = false,
      value24 = false,
      value25 = false,
      value26 = false,
      value27 = false,
      value28 = false,
      value29 = false,
      value30 = false,
      value31 = false,
      value32 = false,
      value33 = false,
      value34 = false,
      value35 = false,
      value36 = false,
      value37 = false,
      value38 = false,
      value39 = false,
      value40 = false,
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
                            TextFormField(
                              validator: (val) {
                                return val.isNotEmpty ? null : "Enter Time";
                              },
                              //

                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'OT-Date of manual cleaning ',
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
                              height:30.0,
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
                                  height: 5,
                                ),
                                CheckboxListTile(
                                  title: Text(
                                      'Bacilloid solution 20ml/1 ltr water'),
                                  value: this.value,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title:
                                      Text('Infecto-Cide N 20 ml/1 ltr water'),
                                  value: this.value3,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value3 = value;
                                      if(value3==true){
                                        infecto = "Infecto-Cide N 20 ml/1 ltr water";
                                      }
                                    });
                                  },
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
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
                                  value: this.value5,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value5 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Dead Wall'),
                                  value: this.value6,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value6 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Door side wall & door'),
                                  value: this.value7,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value7 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Passage wall'),
                                  value: this.value8,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value8 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('AC wall'),
                                  value: this.value9,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value9 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Lower ceiling'),
                                  value: this.value10,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value10 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Upper ceiling'),
                                  value: this.value11,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value11 = value;
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
                                  value: this.value13,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value13 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('OT table, including legs'),
                                  value: this.value14,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value14 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Instrument trolley'),
                                  value: this.value15,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value15 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Surgeons chair'),
                                  value: this.value16,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value16 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Additional storage trolley'),
                                  value: this.value17,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value17 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Additional stool'),
                                  value: this.value18,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value18 = value;
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
                            SizedBox(height: 5),
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
                                value: this.value20,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value20 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('2 corners of lower ceiling'),
                                value: this.value21,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value21 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('4 corners of floor'),
                                value: this.value22,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value22 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text('AC'),
                                value: this.value23,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value23 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of OT table bottom'),
                                value: this.value24,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value25 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of instrument trolley bottom'),
                                value: this.value26,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value26 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of additional storage tray'),
                                value: this.value27,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value27 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of additional stool'),
                                value: this.value28,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value28 = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                    'Intricate geometry area of surgeons chair'),
                                value: this.value29,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.value29 = value;
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
                                height: 10.0,
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
                                  value: this.value31,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value31 = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text('Infecto Cide-N 20ml/1 ltr'),
                                  value: this.value32,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.value32 = value;
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
                                  height: 10.0,
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
                                SizedBox(height: 5),
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
                                  CheckboxListTile(
                                    title: Text('Bacilloid 20ml/1 ltr'),
                                    value: this.value34,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value34 = value;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text('Infecto Cide-N 20ml/1 ltr'),
                                    value: this.value35,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.value35 = value;
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
                                  SizedBox(height: 5),
                                  Column(children: [
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
                                      title:
                                          Text('Tiles on sides of wash basin'),
                                      value: this.value36,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value36 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Granite around wash basin'),
                                      value: this.value37,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value37 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text(
                                          'Escape route window sill(granite)'),
                                      value: this.value38,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value38 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('OT door wall & door'),
                                      value: this.value39,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value39 = value;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: Text('Exit door to passage'),
                                      value: this.value40,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value40 = value;
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
                                      title: Text(
                                          'Storage trolley inside drawers'),
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
                                    SizedBox(height: 5),
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
                                        title:
                                            Text('4 corners of upper ceiling'),
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
                                        title:
                                            Text('4 corners of escape route'),
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
                                        title:
                                            Text('Underneath storage trolley'),
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
                                              'Washroom-chemical used for fumigation',
                                          labelStyle: TextStyle(
                                            height: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
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
                                        height: 10.0,
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
                                          labelText: ' Swab taken on',
                                          labelStyle: TextStyle(
                                            height: 1.2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
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
                                      SizedBox(height: 5),
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
                                            labelText: ' Swab result date',
                                            labelStyle: TextStyle(
                                              height: 1.2,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 18.0,
                                            ),
                                          ),
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
                                                  value: 'Yes',
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
