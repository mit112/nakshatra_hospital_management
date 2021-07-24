import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/constants.dart';

const kFieldStyle = TextStyle(
  fontFamily: kFont,
  letterSpacing: 1.2,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 28.0,
);

class ReportDetailScreen extends StatefulWidget {

  final DocumentSnapshot post;
  ReportDetailScreen({this.post});

  @override
  _ReportDetailScreenState createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

