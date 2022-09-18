import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class tablerowmodelallcat extends StatelessWidget {
  tablerowmodelallcat(this.cat, this.genalloted, this.genadmit,
      this.govtalloted, this.govtadmit);

  final cat;
  final genalloted;
  final genadmit;
  final govtalloted;
  final govtadmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 150,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Center(
                      child: Text(
                    cat,
                    // style: GoogleFonts.rubik(),
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
                        // style: GoogleFonts.rubik(),
                      )))
          ]),
          Padding(padding: EdgeInsets.only(top: 10), child: Divider())
        ]),
      ),
    );
  }
}
