import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTopInfo extends StatelessWidget {
  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/stationeryZonelogo.png'),
            height: 68.0,
            width: 68.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Stationery Zone",
                style: GoogleFonts.yellowtail(
                  fontSize: 40,
                ),
              ),
              Text(
                "A quick as a click",
                style: GoogleFonts.satisfy(fontSize: 21),
              )
            ],
          ),
        ],
      ),
    );
  }
}
