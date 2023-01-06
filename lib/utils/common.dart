import 'package:flutter/cupertino.dart';

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
}
