import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;

import 'package:tneadash2/R1summary.dart';
import 'package:tneadash2/R1summarycategory_wise.dart';
import 'package:tneadash2/R1summaryclg_wise.dart';
import 'package:tneadash2/R2agcolldata.dart';
import 'package:tneadash2/R2agtfc.dart';
import 'package:tneadash2/R2allgeneral.dart';
import 'package:tneadash2/R2allgeneral_TFC.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './main.dart';
import 'R1agcolldata.dart';
import './R1vgtfc.dart';
import './R1allgeneral.dart';
import './R1vgcolldata.dart';
import './R1allgeneral_TFC.dart';
import './Homepage.dart';
import './R2Homepage.dart';
import './R2summary.dart';
import './R2summarycategory_wise.dart';
import './R2summaryclg_wise.dart';
import './R3Homepage.dart';
import './R3agcolldata.dart';
import './R3agtfc.dart';
import './R3allgeneral.dart';
import './R3allgeneral_TFC.dart';

import './R3summary.dart';
import './R3summarycategory_wise.dart';
import './R3summaryclg_wise.dart';

import './R4Homepage.dart';
import './R4agcolldata.dart';
import './R4agtfc.dart';
import './R4allgeneral.dart';
import './R4allgeneral_TFC.dart';

class Cusdrawer2 extends StatelessWidget {
  const Cusdrawer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime round1 = DateTime(2025, 7, 19, 0, 0);
    final DateTime round2 = DateTime(2025, 7, 31, 0, 0);
    final DateTime round3 = DateTime(2025, 8, 12, 0, 0);
    final DateTime round4 = DateTime(2026, 8, 27, 0, 0);

    DateTime today = DateTime.now(); // Get the current date and time
    // DateTime today =
    //     DateTime(2023, 8, 26, 1, 0); // Get the current date and time

    // Compare today's date with the currentDateTime
    int dateresult1 = today.compareTo(round1);
    int dateresult2 = today.compareTo(round2);
    int dateresult3 = today.compareTo(round3);
    int dateresult4 = today.compareTo(round4);
    // int dateresult5 = today.compareTo(round4close);

    return Drawer(
      // backgroundColor: Colors.indigo,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "TNEA ALLOTMENT STATS - 2024",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.indigo,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 25,
          ),
          ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Round 1',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            children: dateresult1 > 0
                ? dateresult2 < 0
                    ? <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Allotments Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1allgeneral()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - College')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1allgeneral_TFC()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - TFC')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1agtfc()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - TFC - Allotment & Joining Stats'))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1agcollsdata()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
                        ),
                      ]
                    : [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1Summary()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Summary')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1summaryclg_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'College Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R1summarycate_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'Category Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                      ]
                : [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: ListTile(
                            title: Text(
                          'Round 1 Provisional Not yet started',
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                  ],
          ),
          ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Round 2',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            children: dateresult2 > 0
                ? dateresult3 < 0
                    ? [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2MyHomePage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Allotments Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2allgeneral()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - College')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2allgeneral_TFC()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - TFC')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2agtfc()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - TFC - Allotment & Joining Stats'))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2agcollsdata()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
                        ),
                      ]
                    : <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2Summary()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Summary')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2summaryclg_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'College Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R2summarycate_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'Category Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                      ]
                : [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: ListTile(
                            title: Text(
                          'Round 2 Provisional Not yet started',
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                  ],
          ),
          ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Round 3',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            children: dateresult3 > 0
                ? dateresult4 < 0
                    ? [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3MyHomePage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Allotments Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3allgeneral()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - College')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3allgeneral_TFC()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text('Category Wise Stats - TFC')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3agtfc()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - TFC - Allotment & Joining Stats'))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3agcollsdata()),
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                  title: Text(
                                      'Academic General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
                        ),
                      ]
                    : <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3Summary()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(title: Text('Summary')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3summaryclg_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'College Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => R3summarycate_wise()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                title: Text(
                                    'Category Wise - Provisional Allotments & Joining Stats')),
                          ),
                        ),
                        //
                      ]
                : [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: ListTile(
                            title: Text(
                          'Round 3 Provisional Not yet started',
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                  ],
          ),
          // ExpansionTile(
          //   title: Padding(
          //     padding: EdgeInsets.only(left: 10),
          //     child: Text(
          //       'Round 4',
          //       style: TextStyle(
          //         fontWeight: FontWeight.w400,
          //         fontSize: 17,
          //       ),
          //     ),
          //   ),
          //   children: dateresult4 > 0
          //       ? dateresult5 < 0
          //           ? <Widget>[
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => R4MyHomePage()),
          //                   );
          //                 },
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: 12.0),
          //                   child: ListTile(title: Text('Allotments Stats')),
          //                 ),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => R4allgeneral()),
          //                   );
          //                 },
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: 12.0),
          //                   child: ListTile(
          //                       title: Text('Category Wise Stats - College')),
          //                 ),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => R4allgeneral_TFC()),
          //                   );
          //                 },
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: 12.0),
          //                   child: ListTile(
          //                       title: Text('Category Wise Stats - TFC')),
          //                 ),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => R4agtfc()),
          //                   );
          //                 },
          //                 child: Padding(
          //                     padding: EdgeInsets.only(left: 12.0),
          //                     child: ListTile(
          //                         title: Text(
          //                             'Academic General/Govt-7.5% - TFC - Allotment & Joining Stats'))),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pushReplacement(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => R4agcollsdata()),
          //                   );
          //                 },
          //                 child: Padding(
          //                     padding: EdgeInsets.only(left: 12.0),
          //                     child: ListTile(
          //                         title: Text(
          //                             'Academic General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
          //               ),
          //             ]
          //           : []
          //       : [
          //           GestureDetector(
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 12.0),
          //               child: ListTile(
          //                   title: Text(
          //                 'Round 4 Not yet started',
          //                 style: TextStyle(color: Colors.red),
          //               )),
          //             ),
          //           ),
          //         ],
          // ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/config');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.indigo.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.indigo.shade600,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Configuration Settings',
                      style: TextStyle(
                        color: Colors.indigo.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.indigo.shade600,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.indigo,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
