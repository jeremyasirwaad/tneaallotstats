import 'package:flutter/material.dart';
import 'package:tneadash2/R1summarycategory_wisegovt.dart';
import 'package:tneadash2/R1summaryclg_wisegovt.dart';
import 'package:tneadash2/tablerowmodelsummaryclg_wise.dart';
import './Cusdrawer2.dart';
import './tablerowmodel.dart';
import 'dart:convert';
import 'dart:ui';
import './const.dart';

import './models/R1allstats.dart';
import './models/TFCdata.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './R1govtagcolldata.dart';
import './models/R1summarycategorywise.dart';
import './R3summarycategory_wisegovt.dart';

class R3summarycate_wise extends StatefulWidget {
  R3summarycate_wise({Key? key}) : super(key: key);
  @override
  State<R3summarycate_wise> createState() => _R2summarycategory_wiseState();
}

class _R2summarycategory_wiseState extends State<R3summarycate_wise> {
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

  int agaandj_anna = -1;
  int agaandj_contituclg = -1;
  int agaandj_Govteng = -1;
  int agaandj_Govtaided = -1;
  int agaandj_Central = -1;
  int agaandj_Annamala = -1;
  int agaandj_sf1 = -1;
  int agaandj_sf2 = -1;
  int agaandj_sf3 = -1;

  int agaandjjoined_anna = -1;
  int agaandjjoined_contituclg = -1;
  int agaandjjoined_Govteng = -1;
  int agaandjjoined_Govtaided = -1;
  int agaandjjoined_Central = -1;
  int agaandjjoined_Annamala = -1;
  int agaandjjoined_sf1 = -1;
  int agaandjjoined_sf2 = -1;
  int agaandjjoined_sf3 = -1;

  int agupward_anna = -1;
  int agupawrd_contituclg = -1;
  int agupward_Govteng = -1;
  int agupward_Govtaided = -1;
  int agupward_Central = -1;
  int agupward_Annamala = -1;
  int agupward_sf1 = -1;
  int agupward_sf2 = -1;
  int agupward_sf3 = -1;

  int agupwardjoined_anna = -1;
  int agupawrdjoined_contituclg = -1;
  int agupwardjoined_Govteng = -1;
  int agupwardjoined_Govtaided = -1;
  int agupwardjoined_Central = -1;
  int agupwardjoined_Annamala = -1;
  int agupwardjoined_sf1 = -1;
  int agupwardjoined_sf2 = -1;
  int agupwardjoined_sf3 = -1;

  void calculatedata() {
    int tagaandj_anna = 0;
    int tagaandj_contituclg = 0;
    int tagaandj_Govteng = 0;
    int tagaandj_Govtaided = 0;
    int tagaandj_Central = 0;
    int tagaandj_Annamala = 0;
    int tagaandj_sf1 = 0;
    int tagaandj_sf2 = 0;
    int tagaandj_sf3 = 0;

    int tagaandjjoined_anna = 0;
    int tagaandjjoined_contituclg = 0;
    int tagaandjjoined_Govteng = 0;
    int tagaandjjoined_Govtaided = 0;
    int tagaandjjoined_Central = 0;
    int tagaandjjoined_Annamala = 0;
    int tagaandjjoined_sf1 = 0;
    int tagaandjjoined_sf2 = 0;
    int tagaandjjoined_sf3 = 0;

    int tagupward_anna = 0;
    int tagupawrd_contituclg = 0;
    int tagupward_Govteng = 0;
    int tagupward_Govtaided = 0;
    int tagupward_Central = 0;
    int tagupward_Annamala = 0;
    int tagupward_sf1 = 0;
    int tagupward_sf2 = 0;
    int tagupward_sf3 = 0;

    int tagupwardjoined_anna = 0;
    int tagupawrdjoined_contituclg = 0;
    int tagupwardjoined_Govteng = 0;
    int tagupwardjoined_Govtaided = 0;
    int tagupwardjoined_Central = 0;
    int tagupwardjoined_Annamala = 0;
    int tagupwardjoined_sf1 = 0;
    int tagupwardjoined_sf2 = 0;
    int tagupwardjoined_sf3 = 0;

    agaandj.forEach((e) => {
          // if (e.id == 1) {print(e.agajcount)}
          if (e.iId == 1) {tagaandj_Annamala += e.agajcount as int},
          if (e.iId == 2) {tagaandj_anna += e.agajcount as int},
          if (e.iId == 3)
            {
              tagaandj_Central += e.agajcount as int,
            },
          if (e.iId == 4) {tagaandj_Govtaided += e.agajcount as int},
          if (e.iId == 5) {tagaandj_Govteng += e.agajcount as int},
          if (e.iId == 6) {tagaandj_sf1 += e.agajcount as int},
          if (e.iId == 7) {tagaandj_sf2 += e.agajcount as int},
          if (e.iId == 8) {tagaandj_sf3 += e.agajcount as int},
          if (e.iId == 9) {tagaandj_contituclg += e.agajcount as int},
        });

    vgaandj.forEach((e) => {
          if (e.iId == 1) {tagaandj_Annamala += e.vgajcount as int},
          if (e.iId == 2) {tagaandj_anna += e.vgajcount as int},
          if (e.iId == 3) {tagaandj_Central += e.vgajcount as int},
          if (e.iId == 4) {tagaandj_Govtaided += e.vgajcount as int},
          if (e.iId == 5) {tagaandj_Govteng += e.vgajcount as int},
          if (e.iId == 6) {tagaandj_sf1 += e.vgajcount as int},
          if (e.iId == 7) {tagaandj_sf2 += e.vgajcount as int},
          if (e.iId == 8) {tagaandj_sf3 += e.vgajcount as int},
          if (e.iId == 9) {tagaandj_contituclg += e.vgajcount as int},
        });

    agaandjoined.forEach((e) => {
          if (e.iId == 1) {tagaandjjoined_Annamala += e.agajjoined as int},
          if (e.iId == 2) {tagaandjjoined_anna += e.agajjoined as int},
          if (e.iId == 3) {tagaandjjoined_Central += e.agajjoined as int},
          if (e.iId == 4) {tagaandjjoined_Govtaided += e.agajjoined as int},
          if (e.iId == 5) {tagaandjjoined_Govteng += e.agajjoined as int},
          if (e.iId == 6) {tagaandjjoined_sf1 += e.agajjoined as int},
          if (e.iId == 7) {tagaandjjoined_sf2 += e.agajjoined as int},
          if (e.iId == 8) {tagaandjjoined_sf3 += e.agajjoined as int},
          if (e.iId == 9) {tagaandjjoined_contituclg += e.agajjoined as int},
        });

    vgaandjoined.forEach((e) => {
          if (e.iId == 1) {tagaandjjoined_Annamala += e.vgajjoined as int},
          if (e.iId == 2) {tagaandjjoined_anna += e.vgajjoined as int},
          if (e.iId == 3) {tagaandjjoined_Central += e.vgajjoined as int},
          if (e.iId == 4) {tagaandjjoined_Govtaided += e.vgajjoined as int},
          if (e.iId == 5) {tagaandjjoined_Govteng += e.vgajjoined as int},
          if (e.iId == 6) {tagaandjjoined_sf1 += e.vgajjoined as int},
          if (e.iId == 7) {tagaandjjoined_sf2 += e.vgajjoined as int},
          if (e.iId == 8) {tagaandjjoined_sf3 += e.vgajjoined as int},
          if (e.iId == 9) {tagaandjjoined_contituclg += e.vgajjoined as int},
        });

    agupward.forEach((e) => {
          if (e.iId == 1) {tagupward_Annamala += e.agupcount as int},
          if (e.iId == 2) {tagupward_anna += e.agupcount as int},
          if (e.iId == 3) {tagupward_Central += e.agupcount as int},
          if (e.iId == 4) {tagupward_Govtaided += e.agupcount as int},
          if (e.iId == 5) {tagupward_Govteng += e.agupcount as int},
          if (e.iId == 6) {tagupward_sf1 += e.agupcount as int},
          if (e.iId == 7) {tagupward_sf2 += e.agupcount as int},
          if (e.iId == 8) {tagupward_sf3 += e.agupcount as int},
          if (e.iId == 9) {tagupawrd_contituclg += e.agupcount as int},
        });

    vgupward.forEach((e) => {
          if (e.iId == 1) {tagupward_Annamala += e.vgupcount as int},
          if (e.iId == 2) {tagupward_anna += e.vgupcount as int},
          if (e.iId == 3) {tagupward_Central += e.vgupcount as int},
          if (e.iId == 4) {tagupward_Govtaided += e.vgupcount as int},
          if (e.iId == 5) {tagupward_Govteng += e.vgupcount as int},
          if (e.iId == 6) {tagupward_sf1 += e.vgupcount as int},
          if (e.iId == 7) {tagupward_sf2 += e.vgupcount as int},
          if (e.iId == 8) {tagupward_sf3 += e.vgupcount as int},
          if (e.iId == 9) {tagupawrd_contituclg += e.vgupcount as int},
        });

    agupwardjoined.forEach((e) => {
          if (e.iId == 1) {tagupwardjoined_Annamala += e.agupjoined as int},
          if (e.iId == 2) {tagupwardjoined_anna += e.agupjoined as int},
          if (e.iId == 3) {tagupwardjoined_Central += e.agupjoined as int},
          if (e.iId == 4) {tagupwardjoined_Govtaided += e.agupjoined as int},
          if (e.iId == 5) {tagupwardjoined_Govteng += e.agupjoined as int},
          if (e.iId == 6) {tagupwardjoined_sf1 += e.agupjoined as int},
          if (e.iId == 7) {tagupwardjoined_sf2 += e.agupjoined as int},
          if (e.iId == 8) {tagupwardjoined_sf3 += e.agupjoined as int},
          if (e.iId == 9) {tagupawrdjoined_contituclg += e.agupjoined as int},
        });

    vgupwardjoined.forEach((e) => {
          if (e.iId == 1) {tagupwardjoined_Annamala += e.vgupjoined as int},
          if (e.iId == 2) {tagupwardjoined_anna += e.vgupjoined as int},
          if (e.iId == 3) {tagupwardjoined_Central += e.vgupjoined as int},
          if (e.iId == 4) {tagupwardjoined_Govtaided += e.vgupjoined as int},
          if (e.iId == 5) {tagupwardjoined_Govteng += e.vgupjoined as int},
          if (e.iId == 6) {tagupwardjoined_sf1 += e.vgupjoined as int},
          if (e.iId == 7) {tagupwardjoined_sf2 += e.vgupjoined as int},
          if (e.iId == 8) {tagupwardjoined_sf3 += e.vgupjoined as int},
          if (e.iId == 9) {tagupawrdjoined_contituclg += e.vgupjoined as int},
        });

    setState(() {
      agaandj_anna = tagaandj_anna;
      agaandj_contituclg = tagaandj_contituclg;
      agaandj_Govteng = tagaandj_Govteng;
      agaandj_Govtaided = tagaandj_Govtaided;
      agaandj_Central = tagaandj_Central;
      agaandj_Annamala = tagaandj_Annamala;
      agaandj_sf1 = tagaandj_sf1;
      agaandj_sf2 = tagaandj_sf2;
      agaandj_sf3 = tagaandj_sf3;

      agaandjjoined_anna = tagaandjjoined_anna;
      agaandjjoined_contituclg = tagaandjjoined_contituclg;
      agaandjjoined_Govteng = tagaandjjoined_Govteng;
      agaandjjoined_Govtaided = tagaandjjoined_Govtaided;
      agaandjjoined_Central = tagaandjjoined_Central;
      agaandjjoined_Annamala = tagaandjjoined_Annamala;
      agaandjjoined_sf1 = tagaandjjoined_sf1;
      agaandjjoined_sf2 = tagaandjjoined_sf2;
      agaandjjoined_sf3 = tagaandjjoined_sf3;

      agupward_anna = tagupward_anna;
      agupawrd_contituclg = tagupawrd_contituclg;
      agupward_Govteng = tagupward_Govteng;
      agupward_Govtaided = tagupward_Govtaided;
      agupward_Central = tagupward_Central;
      agupward_Annamala = tagupward_Annamala;
      agupward_sf1 = tagupward_sf1;
      agupward_sf2 = tagupward_sf2;
      agupward_sf3 = tagupward_sf3;

      agupwardjoined_anna = tagupwardjoined_anna;
      agupawrdjoined_contituclg = tagupawrdjoined_contituclg;
      agupwardjoined_Govteng = tagupwardjoined_Govteng;
      agupwardjoined_Govtaided = tagupwardjoined_Govtaided;
      agupwardjoined_Central = tagupwardjoined_Central;
      agupwardjoined_Annamala = tagupwardjoined_Annamala;
      agupwardjoined_sf1 = tagupwardjoined_sf1;
      agupwardjoined_sf2 = tagupwardjoined_sf2;
      agupwardjoined_sf3 = tagupwardjoined_sf3;
    });
  }

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(Uri.parse('${ip}r3stmode2/88888'),
        headers: {'x-auth-token': token});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var datadart = R1SummaryCategorywise.fromJson(data);

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

      calculatedata();
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
    super.dispose();
  }

  @override
  void initState() {
    fetchAlbum();
    fetchAlbum2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Category Wise - General - Round 3",
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 120,
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Center(
                                    child: Text(
                                  "Category",
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
                                "Provisional Allotments given",
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
                    tablerowmodelsummaryclg_wise(
                        "Anna University Department Colleges",
                        agaandj_anna,
                        agaandjjoined_anna,
                        agupward_anna,
                        agupwardjoined_anna,
                        agaandjjoined_anna + agupward_anna,
                        agaandjjoined_anna + agupwardjoined_anna),
                    tablerowmodelsummaryclg_wise(
                        "University Constituent Colleges",
                        agaandj_contituclg,
                        agaandjjoined_contituclg,
                        agupawrd_contituclg,
                        agupawrdjoined_contituclg,
                        agaandjjoined_contituclg + agupawrd_contituclg,
                        agaandjjoined_contituclg + agupawrd_contituclg),
                    tablerowmodelsummaryclg_wise(
                        "Government Engineering Colleges",
                        agaandj_Govteng,
                        agaandjjoined_Govteng,
                        agupward_Govteng,
                        agupwardjoined_Govteng,
                        agaandjjoined_Govteng + agupward_Govteng,
                        agaandjjoined_Govteng + agupwardjoined_Govteng),
                    tablerowmodelsummaryclg_wise(
                        "Government Aided Engineering Colleges",
                        agaandj_Govtaided,
                        agaandjjoined_Govtaided,
                        agupward_Govtaided,
                        agupwardjoined_Govtaided,
                        agaandjjoined_Govtaided + agupward_Govtaided,
                        agaandjjoined_Govtaided + agupwardjoined_Govtaided),
                    tablerowmodelsummaryclg_wise(
                        "Central Government Colleges",
                        agaandj_Central,
                        agaandjjoined_Central,
                        agupward_Central,
                        agupwardjoined_Central,
                        agaandjjoined_Central + agupward_Central,
                        agaandjjoined_Central + agupwardjoined_Central),
                    tablerowmodelsummaryclg_wise(
                        "Annamalai University",
                        agaandj_Annamala,
                        agaandjjoined_Annamala,
                        agupward_Annamala,
                        agupwardjoined_Annamala,
                        agaandjjoined_Annamala + agupward_Annamala,
                        agaandjjoined_Annamala + agupwardjoined_Annamala),
                    tablerowmodelsummaryclg_wise(
                        "Self Financing (Tier 1) Colleges",
                        agaandj_sf1,
                        agaandjjoined_sf1,
                        agupward_sf1,
                        agupwardjoined_sf1,
                        agaandjjoined_sf1 + agupward_sf1,
                        agaandjjoined_sf1 + agupwardjoined_sf1),
                    tablerowmodelsummaryclg_wise(
                        "Self Financing (Tier 2) Colleges",
                        agaandj_sf2,
                        agaandjjoined_sf2,
                        agupward_sf2,
                        agupwardjoined_sf2,
                        agaandjjoined_sf2 + agupward_sf2,
                        agaandjjoined_sf2 + agupwardjoined_sf2),
                    tablerowmodelsummaryclg_wise(
                        "Self Financing (Tier 3) Colleges",
                        agaandj_sf3,
                        agaandjjoined_sf3,
                        agupward_sf3,
                        agupwardjoined_sf3,
                        agaandjjoined_sf3 + agupward_sf3,
                        agaandjjoined_sf3 + agupwardjoined_sf3),
                  ]),
                ),
              ),
            ),
    );
  }
}

// int getproviallotgiven(int clgcode, List<Agaandj> agaandj) {
//   var data = agaandj
//       .firstWhere((element) => element.sId == clgcode.toString(),
//           orElse: () => Agaandj())
//       .agajcount;
//   // return Intpar data;
//   if (data == null) {
//     return 0;
//   }
//   return data;
// }

// int getproviallotjoined(int clgcode, List<Agaandjjoined> agaandjjoined) {
//   var data = agaandjjoined
//       .firstWhere((element) => element.sId == clgcode.toString(),
//           orElse: () => Agaandjjoined())
//       .agajjoined;
//   // return Intpar data;
//   if (data == null) {
//     return 0;
//   }
//   return data;
// }

// int getproviallotgiveninup(int clgcode, List<Agupward> agupward) {
//   var data = agupward
//       .firstWhere((element) => element.sId == clgcode.toString(),
//           orElse: () => Agupward())
//       .agupcount;
//   // return Intpar data;
//   if (data == null) {
//     return 0;
//   }
//   return data;
// }

// int getproviallotgiveninup2(int clgcode, List<Agupwardjoined> agupwardjoined) {
//   var data = agupwardjoined
//       .firstWhere((element) => element.sId == clgcode.toString(),
//           orElse: () => Agupwardjoined())
//       .agupjoined;
//   // return Intpar data;
//   if (data == null) {
//     return 0;
//   }
//   return data;
// }

// int gettotalallotment(
//     int clgcode, List<Agaandj> agaandj, List<Agupward> agupward) {
//   int data1 = getproviallotgiven(clgcode, agaandj);
//   int data2 = getproviallotgiveninup(clgcode, agupward);

//   return data1 + data2;
// }

// int gettotaljoined(int clgcode, List<Agaandjjoined> agaandjjoined,
//     List<Agupwardjoined> agupwardjoined) {
//   int data1 = getproviallotjoined(clgcode, agaandjjoined);
//   int data2 = getproviallotgiveninup2(clgcode, agupwardjoined);

//   return data1 + data2;
// }

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
        MaterialPageRoute(builder: (context) => R3summarycate_wise()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => R3summarycategovt_wise()),
      );
      break;
  }
}
