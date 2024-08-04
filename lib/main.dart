import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tneadash2/R2Homepage.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './govtmain.dart';
import './Homepage.dart';
import './R1summary.dart';
import './R2summary.dart';
import './R3Homepage.dart';
import './R4Homepage.dart';
// import 'package:multilevel_drawer/multilevel_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allotment and Admissions',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: homepagedecider(),
    );
  }
}

Widget homepagedecider() {
  final DateTime round1 = DateTime(2024, 8, 1, 0, 0);
  final DateTime round2 = DateTime(2024, 8, 10, 0, 0);
  final DateTime round3 = DateTime(2024, 8, 23, 0, 0);
  DateTime today = DateTime.now();

  if (today.compareTo(round3) > 0) {
    return const R3MyHomePage();
  }
  if (today.compareTo(round2) > 0) {
    return const R2MyHomePage();
  }
  if (today.compareTo(round1) > 0) {
    return const MyHomePage();
  } else {
    return const MyHomePage();
  }
}
