import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class tablerowmodelsummaryclg_wise extends StatelessWidget {
  tablerowmodelsummaryclg_wise(this.cat, this.genalloted, this.genadmit,
      this.govtalloted, this.govtadmit, this.data1, this.data2);

  final cat;
  final genalloted;
  final genadmit;
  final govtalloted;
  final govtadmit;
  final data1;
  final data2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 120,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Center(
                      child: Text(
                    cat,
                    // style: TextStyle(fontSize: 12),
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  )),
                )),
            Expanded(
                child: Center(
                    child: genalloted == -1
                        ? SpinKitThreeBounce(
                            color: Colors.indigo,
                            size: 10,
                          )
                        : Text(
                            genalloted.toString(),
                            style: TextStyle(fontSize: 12),
                            // style: GoogleFonts.rubik(),
                          ))),
            Expanded(
                child: Center(
                    child: genadmit == -1
                        ? SpinKitThreeBounce(
                            color: Colors.indigo,
                            size: 10,
                          )
                        : Text(
                            genadmit.toString(),
                            style: TextStyle(fontSize: 12),
                            // style: GoogleFonts.rubik(),
                          ))),
            Expanded(
                child: Center(
                    child: govtalloted == -1
                        ? SpinKitThreeBounce(
                            color: Colors.indigo,
                            size: 10,
                          )
                        : Text(
                            govtalloted.toString(),
                            style: TextStyle(fontSize: 12),
                            // style: GoogleFonts.rubik(),
                          ))),
            Expanded(
                child: govtadmit == -1
                    ? SpinKitThreeBounce(
                        color: Colors.indigo,
                        size: 10,
                      )
                    : Center(
                        child: Text(
                        govtadmit.toString(),
                        style: TextStyle(fontSize: 12),
                        // style: GoogleFonts.rubik(),
                      ))),
            Expanded(
                child: data1 == -1 || data1 == -2
                    ? SpinKitThreeBounce(
                        color: Colors.indigo,
                        size: 10,
                      )
                    : Center(
                        child: Text(
                        data1.toString(),
                        style: TextStyle(fontSize: 12),
                        // style: GoogleFonts.rubik(),
                      ))),
            Expanded(
                child: data2 == -1 || data2 == -2
                    ? SpinKitThreeBounce(
                        color: Colors.indigo,
                        size: 10,
                      )
                    : Center(
                        child: Text(
                        data2.toString(),
                        style: TextStyle(fontSize: 12),
                        // style: GoogleFonts.rubik(),
                      )))
          ]),
          Padding(padding: EdgeInsets.only(top: 10), child: Divider())
        ]),
      ),
    );
  }
}
