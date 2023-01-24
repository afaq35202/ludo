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

  static Widget noDataFoundError(String text, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
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

  static Map<String, String> getHeaders() {
    return {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTQ1MjYzMDU3Y2YxYzYwMzc1Mzk1ZTEyZWZjNTM0M2VjNDg1MzUxMTY4ZTcxMjdkOTJkYjViY2QxOWU2ZWU4Y2U2NjY4Y2ZlNzg0OGYwMjMiLCJpYXQiOjE2NzQ1NTUxNjkuODY2OTk4LCJuYmYiOjE2NzQ1NTUxNjkuODY3MDAzLCJleHAiOjE3MDYwOTExNjkuNzc2NzQzLCJzdWIiOiIxMCIsInNjb3BlcyI6W119.mT4B9x7nbiDhQdHgmdFBvcFP0wzGGIoTeOaNSMDLKlvA4J7feV6m7Ai_McCXgIemeLznT_oTADl3Uqo38kNF-zkBrSgN6uqxx6ACKIwfpHoGOrL0DUTJm8x-aYq8fKoOMVZ502OUGGT5nf2iiLWlWRfCAl1-u5wLHvOOj2pyqCZcdEEHxrw48fbbu6NtEEnPYuNFVYsljydiEl-hjX6pxv69hyGKBDaiWg3pc2U7vPq0V9SoLzCeDCMPifYG3Bf_cTirpqeeuvVgUaRoacZ5EBsggWV_4t6seudntsWf1KTos_vBzUR3l1titsygU7yhICQa0CF_GcbRgkmutzx_9ZX9HosGkZ6kJj6yRqrwzsDNXzMB9jgPLZSpG1gyCa-484FyGt1oe9ZYXiPgmeQ6iluVl8LyZdQYkNfdTvxVDydXb2ajeuM_V2QsPKABOaOmK_9g_DzN75YpunDObeURgSxCKhKqcvZlyE_FjpmQUFYq_pFtv-p_GQkoknkOmUf-M7IBa7HJLoPutayswF_SOJMxvis8wooaBv_msEuOROw63PN_IggMmWo9BwZwjfC_W8WRzaNPBkmGKn-AXLtbCZne8tSQMXxDWscvGW41cNslaqyv0Q26n5Ket5QudT_347JpbdigQulptYKvUqcFZmFLM_TIOQoKtatzaHhBbmY"
    };
  }
}
