import 'dart:convert';
import 'dart:ui';
import './const.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;

import 'package:tneadash2/R2Homepage.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './govtmain.dart';
import './Homepage.dart';
import './R4Homepage.dart';

class R4MyHomePagegovt extends StatefulWidget {
  const R4MyHomePagegovt({Key? key}) : super(key: key);

  @override
  State<R4MyHomePagegovt> createState() => _R3MyHomePagegovtState();
}

class _R3MyHomePagegovtState extends State<R4MyHomePagegovt> {
  var agtotalcand = -1;
  var agtotalallocs = -1;
  var agtotalcols = -1;
  var agtotalfts = -1;

  var agadmitcols = -1;
  var agadmitftcs = -1;

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(Uri.parse('${gip}r4stcount/88888'),
        headers: {'x-auth-token': token});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datadart = allotstats.fromJson(data);
      print(datadart.agtotalcand![0].agtotalcand);
      // print(data);

      setState(() {
        agtotalcand = datadart.agtotalcand![0].agtotalcand as int;
        agtotalallocs = datadart.agtotalallots![0].agtotalallots as int;
        agtotalcols = datadart.agtotalcols![0].agtotalcols as int;
        agtotalfts = datadart.agtotaltfcs![0].agtotaltfcs as int;
        // vgtotalcand = datadart.vgtotalcand![0].vgtotalcand as int;
        // vgtotalallocs = datadart.vgtotalallots![0].vgtotalallots as int;
        // vgtotalcols = datadart.vgtotalcols![0].vgtotalcols as int;
        // vgtotalftcs = datadart.vgtotaltfcs![0].vgtotaltfcs as int;

        if (datadart.agadmitcols!.isEmpty) {
          agadmitcols = 0;
        } else {
          agadmitcols = datadart.agadmitcols![0].agadmitcols as int;
        }

        if (datadart.agadmittfcs!.isEmpty) {
          agadmitftcs = 0;
        } else {
          agadmitftcs = datadart.agadmittfcs![0].agadmittfcs as int;
        }

        // agadmitcols = datadart.agadmitcols![0].agadmitcols as int;
        // agadmitftcs = datadart.agadmittfcs![0].agadmittfcs as int;

        // vgadmitcols = datadart.vgadmitcols![0].vgadmitcols as int;
        // vgadmitftcs = datadart.vgadmittfcs![0].vgadmittfcs as int;
      });
    } else {
      showAlertDialog(context);
      print("Null detectded");

      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Govt 7.5% Allot Stats - Round 4",
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
            color: Colors.white,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  'General',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  'Govt 7.5%',
                  style: TextStyle(color: Colors.indigo),
                ),
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
                                    "Academic Govt total candidates",
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
                      padding: EdgeInsets.only(
                          left: 16, right: 8, top: 20, bottom: 20),
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
                                    "Academic Govt total allotments given",
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
                                      child: agtotalallocs == -1
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
              Divider(
                color: Colors.grey,
                endIndent: 40,
                indent: 40,
                thickness: 1.5,
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
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      "Acad. Govt total candidates to be reported to college",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
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
                                      child: agtotalcols == -1
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 16, top: 20),
                      child: Card(
                        // color: Colors.re
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
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      "Acad. Govt total candidates to be reported to TFC",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
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
                                      child: agtotalfts == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agtotalfts.toString(),
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
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      "Acad. Govt admitted at college",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
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
                                      child: agadmitcols == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agadmitcols.toString(),
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 16, top: 20),
                      child: Card(
                        // color: Colors.re
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
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      "Acad. Govt admitted at TFC",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
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
                                      child: agadmitftcs == -1
                                          ? SpinKitThreeBounce(
                                              color: Colors.indigo,
                                              size: 30,
                                            )
                                          : Text(
                                              agadmitftcs.toString(),
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
        MaterialPageRoute(builder: (context) => R4MyHomePage()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R4MyHomePagegovt()),
      );
      break;
  }
}
