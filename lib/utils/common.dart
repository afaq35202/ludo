import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class Common {
  static LinearGradient gradientBackground(List<Color> color) {
    return LinearGradient(
        colors: color,
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
        stops: const [0.0, 1.0],
        tileMode: TileMode.clamp);
  }

  static List<String> splitText(String title, String splitFrom) {
    return title.split(splitFrom);
  }

  static Widget loader() {
    return const Center(
        child: CircularProgressIndicator(
      color: appLightBlueColor,
    ));
  }

  static Widget noDataFoundError(String text,BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Icon(
              Icons.warning_amber_outlined,
              size: 50,
              color: Colors.red.shade300,
            ),
            Text(text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    fontFamily: GoogleFonts.doppioOne().fontFamily,
                    color: customTextBodyColor))
          ],
        ),
      ),
    );
  }
}
