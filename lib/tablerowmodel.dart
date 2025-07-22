import 'package:flutter/material.dart' hide CarouselController;
import 'package:google_fonts/google_fonts.dart';

class tablerowmodel extends StatelessWidget {
  tablerowmodel(this.sno, this.board, this.count);

  final sno;
  final board;
  final count;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: Center(
                    child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                sno,
                // style: GoogleFonts.rubik(),
              ),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              board,
              // style: GoogleFonts.rubik(),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              count,
              // style: GoogleFonts.rubik(),
            )))
          ]),
          Padding(padding: EdgeInsets.only(top: 10), child: Divider())
        ]),
      ),
    );
  }
}
