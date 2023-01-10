import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo/getx_controllers/dashboard_controller.dart';
import 'package:ludo/screens/dashboard_screen.dart';
import 'package:ludo/utils/app_colors.dart';

import 'authentication_screens/login_screen.dart';
import 'authentication_screens/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w400,
                height: 1,
                fontFamily: GoogleFonts.fredokaOne().fontFamily,
                color: customTextHeadingColor),
        bodyLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            height: 1,
            fontFamily: GoogleFonts.doppioOne().fontFamily,
            color: customTextHeadingColor),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 1,
            fontFamily: GoogleFonts.doppioOne().fontFamily,
            color: customTextBodyColor),
        bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1,
            fontFamily: GoogleFonts.doppioOne().fontFamily,
            color: customTextBodyColor)),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
