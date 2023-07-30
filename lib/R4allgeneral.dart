import 'package:flutter/material.dart';
import 'package:tneadash2/models/categorywise.dart';
import 'package:tneadash2/models/collegecategorymap.dart';
import './Cusdrawer2.dart';
import './tablerowmodel.dart';
import 'dart:convert';
import './const.dart';

import 'dart:ui';
import './models/R1allstats.dart';
import './models/TFCdata.dart';
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
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './R1govtagcolldata.dart';
import './govtmain.dart';
import './models/categorywise.dart';
import './tablerowmodelallcar.dart';

class R4allgeneral extends StatefulWidget {
  const R4allgeneral({Key? key}) : super(key: key);

  @override
  State<R4allgeneral> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<R4allgeneral> {
  void calculatedata() {
    int anna_catg = 0;
    int annamalai_catg = 0;
    int centralgovt_catg = 0;
    int govt_aided_catg = 0;
    int govt_engg_catg = 0;
    int sf1_catg = 0;
    int sf2_catg = 0;
    int sf3_catg = 0;
    int univer_catg = 0;

    int anna_catg_joined = 0;
    int annamalai_catg_joined = 0;
    int centralgovt_catg_joined = 0;
    int govt_aided_catg_joined = 0;
    int govt_engg_catg_joined = 0;
    int sf1_catg_joined = 0;
    int sf2_catg_joined = 0;
    int sf3_catg_joined = 0;
    int univer_catg_joined = 0;

    catag.forEach((element1) {
      if (element1.id == 2) {
        anna_catg = element1.count;
      }

      if (element1.id == 1) {
        annamalai_catg = element1.count;
      }

      if (element1.id == 3) {
        centralgovt_catg = element1.count;
      }

      if (element1.id == 4) {
        govt_aided_catg = element1.count;
      }

      if (element1.id == 5) {
        govt_engg_catg = element1.count;
      }

      if (element1.id == 6) {
        sf1_catg = element1.count;
      }

      if (element1.id == 7) {
        sf2_catg = element1.count;
      }

      if (element1.id == 8) {
        sf3_catg = element1.count;
      }
      if (element1.id == 9) {
        univer_catg = element1.count;
      }
    });

    catagjoined.forEach((element1) {
      if (element1.id == 2) {
        anna_catg_joined = element1.joined;
      }

      if (element1.id == 1) {
        annamalai_catg_joined = element1.joined;
      }

      if (element1.id == 3) {
        centralgovt_catg_joined = element1.joined;
      }

      if (element1.id == 4) {
        govt_aided_catg_joined = element1.joined;
      }

      if (element1.id == 5) {
        govt_engg_catg_joined = element1.joined;
      }

      if (element1.id == 6) {
        sf1_catg_joined = element1.joined;
      }

      if (element1.id == 7) {
        sf2_catg_joined = element1.joined;
      }

      if (element1.id == 8) {
        sf3_catg_joined = element1.joined;
      }
      if (element1.id == 9) {
        univer_catg_joined = element1.joined;
      }
    });

    // print(centralgovt_catg);
    print(centralgovt_catg_joined);

    setState(() {
      ranna_catg = anna_catg;
      rannamalai_catg = annamalai_catg;
      rcentralgovt_catg = centralgovt_catg;
      rgovt_aided_catg = govt_aided_catg;
      rgovt_engg_catg = govt_engg_catg;
      rsf1_catg = sf1_catg;
      rsf2_catg = sf2_catg;
      rsf3_catg = sf3_catg;
      runiver_catg = univer_catg;

      ranna_catg_joined = anna_catg_joined;
      rannamalai_catg_joined = annamalai_catg_joined;
      rcentralgovt_catg_joined = centralgovt_catg_joined;
      rgovt_aided_catg_joined = govt_aided_catg_joined;
      rgovt_engg_catg_joined = govt_engg_catg_joined;
      rsf1_catg_joined = sf1_catg_joined;
      rsf2_catg_joined = sf2_catg_joined;
      rsf3_catg_joined = sf3_catg_joined;
      runiver_catg_joined = univer_catg_joined;
    });
  }

  void calculatedatagovt() {
    int anna_catg = 0;
    int annamalai_catg = 0;
    int centralgovt_catg = 0;
    int govt_aided_catg = 0;
    int govt_engg_catg = 0;
    int sf1_catg = 0;
    int sf2_catg = 0;
    int sf3_catg = 0;
    int univer_catg = 0;

    int anna_catg_joined = 0;
    int annamalai_catg_joined = 0;
    int centralgovt_catg_joined = 0;
    int govt_aided_catg_joined = 0;
    int govt_engg_catg_joined = 0;
    int sf1_catg_joined = 0;
    int sf2_catg_joined = 0;
    int sf3_catg_joined = 0;
    int univer_catg_joined = 0;

    cataggovt.forEach((element1) {
      if (element1.id == 2) {
        anna_catg = element1.count;
      }

      if (element1.id == 1) {
        annamalai_catg = element1.count;
      }

      if (element1.id == 3) {
        centralgovt_catg = element1.count;
      }

      if (element1.id == 4) {
        govt_aided_catg = element1.count;
      }

      if (element1.id == 5) {
        govt_engg_catg = element1.count;
      }

      if (element1.id == 6) {
        sf1_catg = element1.count;
      }

      if (element1.id == 7) {
        sf2_catg = element1.count;
      }

      if (element1.id == 8) {
        sf3_catg = element1.count;
      }
      if (element1.id == 9) {
        univer_catg = element1.count;
      }
    });

    catagjoinedgovt.forEach((element1) {
      if (element1.id == 2) {
        anna_catg_joined = element1.joined;
      }

      if (element1.id == 1) {
        annamalai_catg_joined = element1.joined;
      }

      if (element1.id == 3) {
        centralgovt_catg_joined = element1.joined;
      }

      if (element1.id == 4) {
        govt_aided_catg_joined = element1.joined;
      }

      if (element1.id == 5) {
        govt_engg_catg_joined = element1.joined;
      }

      if (element1.id == 6) {
        sf1_catg_joined = element1.joined;
      }

      if (element1.id == 7) {
        sf2_catg_joined = element1.joined;
      }

      if (element1.id == 8) {
        sf3_catg_joined = element1.joined;
      }
      if (element1.id == 9) {
        univer_catg_joined = element1.joined;
      }
    });

    setState(() {
      ganna_catg = anna_catg;
      gannamalai_catg = annamalai_catg;
      gcentralgovt_catg = centralgovt_catg;
      ggovt_aided_catg = govt_aided_catg;
      ggovt_engg_catg = govt_engg_catg;
      gsf1_catg = sf1_catg;
      gsf2_catg = sf2_catg;
      gsf3_catg = sf3_catg;
      guniver_catg = univer_catg;

      ganna_catg_joined = anna_catg_joined;
      gannamalai_catg_joined = annamalai_catg_joined;
      gcentralgovt_catg_joined = centralgovt_catg_joined;
      ggovt_aided_catg_joined = govt_aided_catg_joined;
      ggovt_engg_catg_joined = govt_engg_catg_joined;
      gsf1_catg_joined = sf1_catg_joined;
      gsf2_catg_joined = sf2_catg_joined;
      gsf3_catg_joined = sf3_catg_joined;
      guniver_catg_joined = univer_catg_joined;
    });
  }

  List<Cat> catag = [];
  List<Catsjoined> catagjoined = [];
  // List<Cat> catvg = [];
  // List<Catsjoined> catvgjoined = [];

  List<Cat> cataggovt = [];
  List<Catsjoined> catagjoinedgovt = [];
  // List<Cat> catvggovt = [];
  // List<Catsjoined> catvgjoinedgovt = [];

  int ranna_catg = -1;
  int rannamalai_catg = -1;
  int rcentralgovt_catg = -1;
  int rgovt_aided_catg = -1;
  int rgovt_engg_catg = -1;
  int rsf1_catg = -1;
  int rsf2_catg = -1;
  int rsf3_catg = -1;
  int runiver_catg = -1;

  int ranna_catg_joined = -1;
  int rannamalai_catg_joined = -1;
  int rcentralgovt_catg_joined = -1;
  int rgovt_aided_catg_joined = -1;
  int rgovt_engg_catg_joined = -1;
  int rsf1_catg_joined = -1;
  int rsf2_catg_joined = -1;
  int rsf3_catg_joined = -1;
  int runiver_catg_joined = -1;

  int ganna_catg = -1;
  int gannamalai_catg = -1;
  int gcentralgovt_catg = -1;
  int ggovt_aided_catg = -1;
  int ggovt_engg_catg = -1;
  int gsf1_catg = -1;
  int gsf2_catg = -1;
  int gsf3_catg = -1;
  int guniver_catg = -1;

  int ganna_catg_joined = -1;
  int gannamalai_catg_joined = -1;
  int gcentralgovt_catg_joined = -1;
  int ggovt_aided_catg_joined = -1;
  int ggovt_engg_catg_joined = -1;
  int gsf1_catg_joined = -1;
  int gsf2_catg_joined = -1;
  int gsf3_catg_joined = -1;
  int guniver_catg_joined = -1;

  Future<dynamic> fetchAlbum() async {
    final response = await http.get(Uri.parse('${ip}r4stmode/88888'),
        headers: {'x-auth-token': token});

    if (response.statusCode == 200) {
      var datadart = Categorywise.fromRawJson(response.body);

      setState(() {
        catag = datadart.catagcols as List<Cat>;
        // catvg = datadart.catvgcols as List<Cat>;
        catagjoined = datadart.catagcolsjoined as List<Catsjoined>;
        // catvgjoined = datadart.catvgcolsjoined as List<Catsjoined>;
      });

      calculatedata();
    } else {
      showAlertDialog(context);
      print("Null detectded");

      throw Exception('Failed to load album');
    }
  }

  Future<dynamic> fetchAlbumgovt() async {
    final response = await http.get(Uri.parse('${gip}r4stmode/88888'),
        headers: {'x-auth-token': token});

    if (response.statusCode == 200) {
      var datadart = Categorywise.fromRawJson(response.body);

      setState(() {
        cataggovt = datadart.catagcols as List<Cat>;
        // catvggovt = datadart.catvgcols as List<Cat>;
        catagjoinedgovt = datadart.catagcolsjoined as List<Catsjoined>;
        // catvgjoinedgovt = datadart.catvgcolsjoined as List<Catsjoined>;
      });

      // print(response.body);
      calculatedatagovt();
      // print("work done");
    } else {
      showAlertDialog(context);
      print("Null detectded");

      throw Exception('Failed to load album');
    }
  }

  Future<dynamic> fetchAlbum2() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/Collegecategory.json");
    final jsonResult = jsonDecode(data);
    // print(jsonResult);
    var collegecategory = collegecategorymap.fromJson(jsonResult);
    setState(() {});
    // print(jsonResult);
    // print(collegecat[1].cname);
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchAlbumgovt();
    fetchAlbum();
    fetchAlbum2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Round 4 - Category Wise - College",
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 150,
                child: Center(
                    child: Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "General Alloted",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              )),
            )),
            Expanded(
                child: Center(
                    child: Text(
              "General Admitted",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              "Govt Alloted",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              "Govt Admitted",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            )))
          ]),
          tablerowmodelallcat("Anna Univ dept Colleges", ranna_catg,
              ranna_catg_joined, ganna_catg, ganna_catg_joined),
          tablerowmodelallcat("University Constituent Colleges", runiver_catg,
              runiver_catg_joined, guniver_catg, guniver_catg_joined),
          tablerowmodelallcat(
              "Government Engineering Colleges",
              rgovt_engg_catg,
              rgovt_engg_catg_joined,
              ggovt_engg_catg,
              ggovt_engg_catg_joined),
          tablerowmodelallcat(
              "Government Aided Engineering Colleges",
              rgovt_aided_catg,
              rgovt_aided_catg_joined,
              ggovt_aided_catg,
              ggovt_aided_catg_joined),
          tablerowmodelallcat(
              "Central Govenment Colleges",
              rcentralgovt_catg,
              rcentralgovt_catg_joined,
              gcentralgovt_catg,
              gcentralgovt_catg_joined),
          tablerowmodelallcat("Annamalai University", rannamalai_catg,
              rannamalai_catg_joined, gannamalai_catg, gannamalai_catg_joined),
          tablerowmodelallcat("Sel-Financing (Tier 1) Colleges", rsf1_catg,
              rsf1_catg_joined, gsf1_catg, gsf1_catg_joined),
          tablerowmodelallcat("Sel-Financing (Tier 2) Colleges", rsf2_catg,
              rsf2_catg_joined, gsf2_catg, gsf2_catg_joined),
          tablerowmodelallcat("Sel-Financing (Tier 3) Colleges", rsf3_catg,
              rsf3_catg_joined, gsf3_catg, gsf3_catg_joined),
          tablerowmodelallcat(
            "Total",
            ranna_catg +
                rannamalai_catg +
                rcentralgovt_catg +
                rgovt_aided_catg +
                rgovt_engg_catg +
                rsf1_catg +
                rsf2_catg +
                rsf3_catg +
                runiver_catg,
            ranna_catg_joined +
                rannamalai_catg_joined +
                rcentralgovt_catg_joined +
                rgovt_aided_catg_joined +
                rgovt_engg_catg_joined +
                rsf1_catg_joined +
                rsf2_catg_joined +
                rsf3_catg_joined +
                runiver_catg_joined,
            ganna_catg +
                gannamalai_catg +
                gcentralgovt_catg +
                ggovt_aided_catg +
                ggovt_engg_catg +
                gsf1_catg +
                gsf2_catg +
                gsf3_catg +
                guniver_catg,
            ganna_catg_joined +
                gannamalai_catg_joined +
                gcentralgovt_catg_joined +
                ggovt_aided_catg_joined +
                ggovt_engg_catg_joined +
                gsf1_catg_joined +
                gsf2_catg_joined +
                gsf3_catg_joined +
                guniver_catg_joined,
          )
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
        MaterialPageRoute(builder: (context) => R4allgeneral()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyGoveHomePage()),
      );
      break;
  }
}
