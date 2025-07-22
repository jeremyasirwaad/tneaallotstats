import 'package:flutter/material.dart' hide CarouselController;
import 'package:tneadash2/tablerowmodelsummaryclg_wise.dart';
import './Cusdrawer2.dart';
import './tablerowmodel.dart';
import 'dart:convert';
import 'dart:ui';
import './models/R1allstats.dart';
import './models/TFCdata.dart';
import 'package:flutter/services.dart';
import './const.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;

import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './R1govtagcolldata.dart';
import './models/R1summarycollegewise.dart';
import 'R1summaryclg_wise.dart';

class R1summaryclg_wisegovt extends StatefulWidget {
  R1summaryclg_wisegovt({Key? key}) : super(key: key);
  @override
  State<R1summaryclg_wisegovt> createState() => _R1summaryclg_wiseStategovt();
}

class _R1summaryclg_wiseStategovt extends State<R1summaryclg_wisegovt> {
  List<Agaandj> agaandj = [];
  List<Agaandjjoined> agaandjoined = [];
  List<Agupward> agupward = [];
  List<Agupwardjoined> agupwardjoined = [];

  List<Vgaandj> vgaandj = [];
  List<Vgaandjjoined> vgaandjoined = [];
  List<Vgupward> vgupward = [];
  List<Vgupwardjoined> vgupwardjoined = [];
  bool isloading = false;

  List<Tfcdata> Tfclist = [];
  List<Tfcdata> Tfclistorigi = [];

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(Uri.parse('${gip}r1stboard2/88888'),
        headers: {'x-auth-token': token});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datadart = R1summaryclgwise.fromJson(data);

      setState(() {
        agaandj = datadart.agaandj as List<Agaandj>;
        agaandjoined = datadart.agaandjjoined as List<Agaandjjoined>;
        agupward = datadart.agupward as List<Agupward>;
        agupwardjoined = datadart.agupwardjoined as List<Agupwardjoined>;

        vgaandj = datadart.vgaandj as List<Vgaandj>;
        vgaandjoined = datadart.vgaandjjoined as List<Vgaandjjoined>;
        vgupward = datadart.vgupward as List<Vgupward>;
        vgupwardjoined = datadart.vgupwardjoined as List<Vgupwardjoined>;

        isloading = false;
      });
    } else {
      showAlertDialog(context);
      print("Null detectded");

      throw Exception('Failed to load album');
    }
  }

  Future<dynamic> fetchAlbum2() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/CLG.json");
    final jsonResult = jsonDecode(data);
    var tfcdata = tfclist.fromJson(jsonResult);
    setState(() {
      Tfclist = tfcdata.tfcdata as List<Tfcdata>;
      Tfclistorigi = tfcdata.tfcdata as List<Tfcdata>;
    });
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   // DeviceOrientation.landscapeLeft,
    // ]);
    fetchAlbum();
    fetchAlbum2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "College Wise - Govt - Round 1",
        style: TextStyle(fontSize: 16),
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
    return Scaffold(
      drawer: Cusdrawer2(),
      appBar: appBar,
      body: isloading
          ? Center(
              child: SpinKitThreeBounce(
                color: Colors.indigo,
                size: 50,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Row(children: [
                        Flexible(
                          child: TextField(
                            onSubmitted: (String value) {
                              // print(value);
                              if (value == "") {
                                setState(() {
                                  Tfclist = Tfclistorigi;
                                });
                              } else {
                                setState(() {
                                  Tfclist = Tfclist.where((element) =>
                                          element.tfccode.toString() == value)
                                      .toList();
                                });
                              }
                              // R1TFC.firstWhere((element) => element.id == value);
                            },
                            controller: myController,
                            onChanged: (text) {
                              if (text == "") {
                                setState(() {
                                  Tfclist = Tfclistorigi;
                                });
                              }
                            },
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      myController.text = "";
                                      Tfclist = Tfclistorigi;
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    });
                                  },
                                  icon: Icon(Icons.clear),
                                ),
                                // hintText: "whatever you want",
                                icon: Icon(Icons.search),
                                labelText: "Enter College Code"),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // Only numbers can be entered
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (myController.text == "") {
                                setState(() {
                                  Tfclist = Tfclistorigi;
                                });
                              } else {
                                setState(() {
                                  Tfclist = Tfclistorigi.where((element) =>
                                      element.tfccode.toString() ==
                                      myController.text).toList();
                                });
                              }
                            },
                            child: Text("Search"))
                      ]),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(
                                    child: Text(
                                  "College Name",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),

                                  // style: GoogleFonts.rubik(),
                                )),
                              )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(1),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Provisional allotments given",
                                textAlign: TextAlign.center,

                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                                // style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                              ),
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(1),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Joined ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                              ),
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(1),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Provisional allotment given in upward ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                              ),
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(1),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Joined",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                              ),
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(3),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Total Allotment ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                              ),
                            )),
                          )),
                          Expanded(
                              child: Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            padding: EdgeInsets.all(3),
                            child: Center(
                                child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Total Joined ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                              ),
                            )),
                          )),
                        ]),
                    ...List.generate(
                      Tfclist.length,
                      (index) => tablerowmodelsummaryclg_wise(
                          Tfclist[index].tfcname,
                          getproviallotgiven(
                              Tfclist[index].tfccode as int, agaandj),
                          getproviallotjoined(
                              Tfclist[index].tfccode as int, agaandjoined),
                          getproviallotgiveninup(
                              Tfclist[index].tfccode as int, agupward),
                          getproviallotgiveninup2(
                              Tfclist[index].tfccode as int, agupwardjoined),
                          gettotalallotment(Tfclist[index].tfccode as int,
                              agaandjoined, agupward),
                          gettotaljoined(Tfclist[index].tfccode as int,
                              agaandjoined, agupwardjoined)),
                    ),
                    Tfclist.isEmpty
                        ? Container(
                            child: Text(
                                "No Data Matching College code, Clear search"))
                        : Container()
                  ]),
                ),
              ),
            ),
    );
  }
}

int getproviallotgiven(int clgcode, List<Agaandj> agaandj) {
  var data = agaandj
      .firstWhere((element) => element.sId == clgcode.toString(),
          orElse: () => Agaandj())
      .agajcount;
  // return Intpar data;
  if (data == null) {
    return 0;
  }
  return data;
}

int getproviallotjoined(int clgcode, List<Agaandjjoined> agaandjjoined) {
  var data = agaandjjoined
      .firstWhere((element) => element.sId == clgcode.toString(),
          orElse: () => Agaandjjoined())
      .agajjoined;
  // return Intpar data;
  if (data == null) {
    return 0;
  }
  return data;
}

int getproviallotgiveninup(int clgcode, List<Agupward> agupward) {
  var data = agupward
      .firstWhere((element) => element.sId == clgcode.toString(),
          orElse: () => Agupward())
      .agupcount;
  // return Intpar data;
  if (data == null) {
    return 0;
  }
  return data;
}

int getproviallotgiveninup2(int clgcode, List<Agupwardjoined> agupwardjoined) {
  var data = agupwardjoined
      .firstWhere((element) => element.sId == clgcode.toString(),
          orElse: () => Agupwardjoined())
      .agupjoined;
  // return Intpar data;
  if (data == null) {
    return 0;
  }
  return data;
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
        MaterialPageRoute(builder: (context) => R1summaryclg_wise()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R1summaryclg_wisegovt()),
      );
      break;
  }
}
