import 'package:flutter/material.dart';
import 'package:tneadash2/R1govtagtfc.dart';
import 'package:tneadash2/R2govtagtfc.dart';
import './Cusdrawer2.dart';
import './tablerowmodel.dart';
import 'dart:convert';
import 'dart:ui';
import './models/R1allstats.dart';
import 'package:flutter/services.dart';
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
import './models/TFCdata.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './R3govtagtfc.dart';

class R3agtfc extends StatefulWidget {
  R3agtfc({Key? key}) : super(key: key);
  @override
  State<R3agtfc> createState() => _R3agtfcState();
}

class _R3agtfcState extends State<R3agtfc> {
  List<Agcol> R1TFC = [];
  List<Sjoined> R1TFCjoined = [];
  bool isloading = true;
  List<Tfcdata> Tfclist = [];
  List<Agcol> R1FTCori = [];

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(
        Uri.parse('http://65.2.37.93/api/api/master/r3stboard/88888'),
        headers: {
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNTZlZjAyNDEtODNjOC00YzM5LTgzYzktOTBjZmUxNTRkNjNlIn0sImlhdCI6MTY2MzI0NjA0MCwiZXhwIjoxODQzMjQ2MDQwfQ.1ZqffhkkKmm8yvOtQQ2ol-r3jr5pjwojiAFzbiuFLRo'
        });

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      // var datadart = allotstats.fromJson(data);
      // print(datadart.agtotalcand![0].agtotalcand);
      // print(data);
      var datadart = Receiveddatacode.fromJson(response.body);

      setState(() {
        R1FTCori = datadart.agtfcs as List<Agcol>;
        R1FTCori.sort(((a, b) => b.count.compareTo(a.count)));
        R1TFC = datadart.agtfcs as List<Agcol>;
        R1TFC.sort(((a, b) => b.count.compareTo(a.count)));
        R1TFCjoined = datadart.agtfcsjoined as List<Sjoined>;
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
        await DefaultAssetBundle.of(context).loadString("assets/TFC.json");
    final jsonResult = jsonDecode(data);
    var tfcdata = tfclist.fromJson(jsonResult);
    setState(() {
      Tfclist = tfcdata.tfcdata as List<Tfcdata>;
    });
    print(jsonResult);
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchAlbum();
    fetchAlbum2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Acad Gen TFC stats - Round 3",
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
                  margin: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Row(children: [
                        Flexible(
                          child: TextField(
                            onSubmitted: (String value) {
                              // print(value);
                              if (value == "") {
                                setState(() {
                                  R1TFC = R1FTCori;
                                });
                              } else {
                                setState(() {
                                  R1TFC = R1FTCori.where(
                                          (element) => element.id == value)
                                      .toList();
                                });
                              }
                              // R1TFC.firstWhere((element) => element.id == value);
                            },
                            controller: myController,
                            onChanged: (text) {
                              // if (text == "") {
                              //   setState(() {
                              //     R1TFC = R1FTCori;
                              //   });
                              // }
                            },
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      myController.text = "";
                                      R1TFC = R1FTCori;
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    });
                                  },
                                  icon: Icon(Icons.clear),
                                ),
                                // hintText: "whatever you want",
                                icon: Icon(Icons.search),
                                labelText: "Enter TFC Code"),
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
                                  R1TFC = R1FTCori;
                                });
                              } else {
                                setState(() {
                                  R1TFC = R1FTCori.where((element) =>
                                      element.id == myController.text).toList();
                                });
                              }
                            },
                            child: Text("Search"))
                      ]),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "TFC Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ))),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            child: Center(
                                child: Text(
                              "Alloted",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                              // style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                            )),
                          )),
                          Expanded(
                              child: Center(
                                  child: Text(
                            "Joined",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          )))
                        ]),
                    ...List.generate(
                        R1TFC.length,
                        (index) => tablerowmodel(
                            getTfcnumber(R1TFC[index].id, Tfclist),
                            R1TFC[index].count.toString(),
                            getjoinednumber(R1TFC[index].id, R1TFCjoined)
                                .toString())),
                    R1TFC.isEmpty
                        ? Container(
                            child:
                                Text("No Data Matching TFC code, clear search"))
                        : Container()
                  ]),
                ),
              ),
            ),
    );
  }
}

String getjoinednumber(String id, List<Sjoined> R1FTCjoined) {
  var int = R1FTCjoined.firstWhere((element) => element.id == id,
      orElse: () => Sjoined(id: id, joined: 0)).joined;
  // print(int);
  return int.toString();
}

String getTfcnumber(String id, List<Tfcdata> Tfcdatain) {
  int idforsending = int.parse(id);
  final Map<String, dynamic> data = {'tfccode': int.parse(id), 'tfcname': id};
  var Tfcname = Tfcdatain.firstWhere(
      (element) => element.tfccode.toString() == id,
      orElse: () => Tfcdata()).tfcname;
  return Tfcname.toString() + " ( TFC code - " + id + " ) ";
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
        MaterialPageRoute(builder: (context) => R3agtfc()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R3govtagtfc()),
      );
      break;
  }
}
