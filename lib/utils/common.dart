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
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNThkM2ViM2Y3NDZiMWIwNTMyNTM2M2Q0NGI4MzkzNTk1YTg1M2MwYTlmZDFkZjg2NGRjMGQyNzE5NzBmMWMxZGFlNzE5NDdhMTY4NDY0NTMiLCJpYXQiOjE2NzQyMTE2MjEuMTUyNTg4LCJuYmYiOjE2NzQyMTE2MjEuMTUyNTg5LCJleHAiOjE3MDU3NDc2MjEuMDYxMTgxLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.QRRf92wjPrybX8UOObkHd8rr661j2lDzrkVwgPR2o2X4rkiCWfjSw8P8QpgjR8-FbzRhSkMwuQ5NkFzqYEpV-4FUEyQiOCuE0kZQvtojwkYK984IdKKDV-fMi291osITLTZ3tnr5FZ6_hvVdTVKqZ5ycpgRd0uwTZk_igJz9iCI3wcWt3SbvAXQ9P3TgkmCBPE_cjMQ-a8MT17XnS9sYrZyDQtnGP5i0WYVjyqbOM_oQnKwmfofJFTdIb14WjN9pyIu5tbGLbJhCTxvFROBlLFquUj8zU2SVdLNZwIf62ShpssCmVXmt311Rl13CcrYG1rF30WAY4aQAaUsqR3rOslwy_h8MeLm9Wp1G_OuTOqPrillfEH3Krz4RePBQ_ogCs0cIMFtqETyE1Z0tbETBJ1Hd_QM1IySJbCo6MovvFlkbwDjn6nlFrMnEM2NOpgwmgtylZS5AT_DDzD-t-7kRn4OnE7MbDBOtmyCKgAUMHpmE4nTbCarp173a0Ac6sgrb8aWr8kTtuH5aBtHe_JPhYcnydDIsZaK4CfanH_F7HlNXTlZ-3RpI0-qV2S6vV6A6OeqP2Pvf8Y5wFjAIB1zaY8rvdTTJCv0p_WZ3Z5EfMf1gkopgvWTP8uDsTCLaDCo0vQM9GnEyL6VAWXZY_-kfVdigh472Z_kvTexzK5HvPXU"
    };
  }
}
