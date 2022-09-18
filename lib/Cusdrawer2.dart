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
import './models/allotstats.dart';
import './R1agtfc.dart';
import './main.dart';
import 'R1agcolldata.dart';
import './R1vgtfc.dart';
import './R1allgeneral.dart';
import './R1vgcolldata.dart';
import './R1allgeneral_TFC.dart';

class Cusdrawer2 extends StatelessWidget {
  const Cusdrawer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "TNEA ALLOTMENT STATS - 2022",
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
            // trailing: Icon(
            //   Icons.keyboard_arrow_down,
            //   color: Colors.indigo,
            // ),
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
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
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
                    MaterialPageRoute(builder: (context) => R1allgeneral()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: ListTile(title: Text('Category Wise Stats - College')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => R1allgeneral_TFC()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: ListTile(title: Text('Category Wise Stats - TFC')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => R1agtfc()),
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
                    MaterialPageRoute(builder: (context) => R1agcollsdata()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: ListTile(
                        title: Text(
                            'Academic General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => R1vgtfc()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: ListTile(
                        title: Text(
                            'Vocational General/Govt-7.5% - TFC - Allotment & Joining Stats'))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => R1vgcollsdata()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: ListTile(
                        title: Text(
                            'Vocational General/Govt-7.5% - Colleges - Allotment & Joining Stats'))),
              ),
            ],
          ),
          const ExpansionTile(
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: ListTile(
                  title: Text(
                    'Round 2 Not Yet Started',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 12.0),
              //   child: ListTile(title: Text('Allotments Stats')),
              // ),
              // Padding(
              //     padding: EdgeInsets.only(left: 12.0),
              //     child:
              //         ListTile(title: Text('TFC - College Allotment Stats'))),
              // Padding(
              //     padding: EdgeInsets.only(left: 12.0),
              //     child: ListTile(title: Text('Joining Stats'))),
            ],
          ),
          const ExpansionTile(
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: ListTile(
                    title: Text(
                      'Round 3 Not Yet Started',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
          const ExpansionTile(
              title: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Round 4',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: ListTile(
                    title: Text(
                      'Round 4 Not Yet Started',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ]),
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
