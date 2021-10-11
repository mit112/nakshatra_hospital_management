import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nakshatra_hospital_management/constants/constants.dart';

class otreport extends StatefulWidget {
  final DocumentSnapshot post;
  otreport({this.post});
  @override
  _otreportState createState() => _otreportState();
}

class _otreportState extends State<otreport> {
  double _scaleFactor = 1.0;
  bool stayOnBottom = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Ot Report"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      constantrow(
                          text: 'date', snap: widget.post.data()['date']),

                      constantrow(
                          text: 'manual cleaning start',
                          snap: widget.post.data()['manual cleaning start']),

                      constantrow(
                          text: 'manual cleaning end',
                          snap: widget.post.data()['manual cleaning end']),

                      constantrow(
                          text: 'disinfectant for manual cleaning',
                          snap: widget.post
                              .data()['disinfectant for manual cleaning']),

                      constantrow(
                          text: 'ot area wiped clean',
                          snap: widget.post.data()['ot area wiped clean']),

                      constantrow(
                          text: 'ot equipment wiped clean',
                          snap: widget.post.data()['ot equipment wiped clean']),

                      constantrow(
                          text: 'non accessible area sprayed with disinfectant',
                          snap: widget.post.data()[
                              'non accessible area sprayed with disinfectant']),

                      constantrow(
                          text: 'ot fumigation date',
                          snap: widget.post.data()['ot fumigation date']),

                      constantrow(
                          text: 'ot fumigation started',
                          snap: widget.post.data()['ot fumigation started']),

                      constantrow(
                          text: 'ot fumigation completed',
                          snap: widget.post.data()['ot fumigation completed']),

                      constantrow(
                          text: 'ot fumigation chemicals used',
                          snap: widget.post
                              .data()['ot fumigation chemicals used']),

                      constantrow(
                          text: 'washroom manual cleaning date',
                          snap: widget.post
                              .data()['washroom manual cleaning date']),

                      constantrow(
                          text: 'washroom-chemical used for manual cleaning',
                          snap: widget.post.data()[
                              'washroom-chemical used for manual cleaning']),

                      constantrow(
                          text: 'washroom area furniture wiped clean',
                          snap: widget.post
                              .data()['washroom area furniture wiped clean']),

                      constantrow(
                          text: 'washroom non accessible area sprayed',
                          snap: widget.post
                              .data()['washroom non accessible area sprayed']),

                      constantrow(
                          text: 'washroom fumigation date',
                          snap: widget.post.data()['washroom fumigation date']),

                      constantrow(
                          text: 'washroom fumigation started',
                          snap: widget.post
                              .data()['washroom fumigation started']),

                      constantrow(
                          text: 'washroom fumigation ended',
                          snap:
                              widget.post.data()['washroom fumigation ended']),

                      constantrow(
                          text: 'washroom chemicals used for fumigation',
                          snap: widget.post.data()[
                              'washroom chemicals used for fumigation']),

                      constantrow(
                          text: 'notes', snap: widget.post.data()['notes']),

                      constantrow(
                          text: 'swab taken on',
                          snap: widget.post.data()['swab taken on']),

                      constantrow(
                          text: 'swab taken time',
                          snap: widget.post.data()['swab taken time']),

                      // constantrow(text: 'swab sample locations',
                      //     snap:  widget.post.data()['swab sample locations']),

                      constantrow(
                          text: 'swab result date',
                          snap: widget.post.data()['swab result date']),

                      constantrow(
                          text: 'swab results',
                          snap: widget.post.data()['swab results']),
                      SizedBox(
                        height: 130.0,
                      ),
                    ],
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