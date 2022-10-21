import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tneadash2/R1summarygovt.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './govtmain.dart';
import './Homepage.dart';
import './R2summarygovt.dart';
import './models/R1summaryconvert.dart';

class R2Summary extends StatefulWidget {
  const R2Summary({Key? key}) : super(key: key);

  @override
  State<R2Summary> createState() => _R2summarypage();
}

class _R2summarypage extends State<R2Summary> {
  var agtotalcand = -1;
  var agtotalallocs = -1;
  var agtotalcols = -1;

  var vgtotalcand = -1;
  var vgtotalallocs = -1;
  var vgtotalcols = -1;

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('http://65.2.37.93/api/api/master/r2stcount2/88888'),
        headers: {
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNTZlZjAyNDEtODNjOC00YzM5LTgzYzktOTBjZmUxNTRkNjNlIn0sImlhdCI6MTY2MzI0NjA0MCwiZXhwIjoxODQzMjQ2MDQwfQ.1ZqffhkkKmm8yvOtQQ2ol-r3jr5pjwojiAFzbiuFLRo'
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datadart = R1summaryconvert.fromJson(data);
      print(datadart.agtotalcand![0].agtotalcand);
      // print(data);

      setState(() {
        agtotalcand = datadart.agtotalcand![0].agtotalcand as int;
        agtotalallocs = datadart.agtotalallots![0].agtotalallots as int;
        agtotalcols = datadart.agadmitcols![0].agadmitcols as int;
        // vgtotalcand = datadart.vgtotalcand![0].vgtotalcand as int;
        // vgtotalallocs = datadart.vgtotalallots![0].vgtotalallots as int;
        // vgtotalcols = datadart.vgadmitcols![0].vgadmitcols as int;
      });
    } else {
      showAlertDialog(context);
      print("Null detectded");

      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    // TODO: implement initState
    fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Round 2 - Summary",
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme().apply(bodyColor: Colors.white),
          ),
          child: PopupMenuButton<int>(
            color: Colors.indigo,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('General'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Govt 7.5%'),
              ),
            ],
          ),
        ),
      ],
    );

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double ctheight = height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(title: Text(("Allotment Stats"))),
        appBar: appBar,
        drawer: Cusdrawer2(),
        body: ListView(children: [
          Container(
            // height: ctheight,
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 8, top: 20),
                      child: Card(
                        // color: Color.fromARGB(255, 148, 118, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 6,
                        // color: Colors.black,
                        child: Container(
                          height: ctheight / 4 - 10,
                          child: Stack(children: [
                            Positioned(
                              top: 20,
                              left: 15,
                              right: 15,
                              child: Container(
                                width: 150,
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    "Academic General total candidates",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: agtotalcand == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agtotalcand.toString(),
                                              style: GoogleFonts.rubik(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 60,
                                                  color: Colors.indigo),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 8, top: 20),
                      child: Card(
                        // color: Color.fromARGB(255, 148, 118, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 6,
                        // color: Colors.black,
                        child: Container(
                          height: ctheight / 4 - 10,
                          child: Stack(children: [
                            Positioned(
                              top: 20,
                              left: 15,
                              right: 15,
                              child: Container(
                                width: 150,
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    "Academic Gen total provisional allotment",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: agtotalcand == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agtotalallocs.toString(),
                                              style: GoogleFonts.rubik(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 60,
                                                  color: Colors.indigo),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 8, top: 20),
                      child: Card(
                        // color: Color.fromARGB(255, 148, 118, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 6,
                        // color: Colors.black,
                        child: Container(
                          height: ctheight / 4 - 10,
                          child: Stack(children: [
                            Positioned(
                              top: 20,
                              left: 15,
                              right: 15,
                              child: Container(
                                width: 150,
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    "Academic General Joined College",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: agtotalcand == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agtotalcols.toString(),
                                              style: GoogleFonts.rubik(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 60,
                                                  color: Colors.indigo),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey,
                endIndent: 40,
                indent: 40,
                thickness: 1.5,
              ),
              SizedBox(
                height: 30,
              )
            ]),
          ),
        ]));
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () async {
        Navigator.pop(context);
        // await Navigator.of(context)
        //     .push(new MaterialPageRoute(builder: (context) => cvpage()));
        // setState((){});
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Server is Busy"),
    content: Text("Please Try again later"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R2Summary()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R2Summarygovt()),
      );
      break;
  }
}
