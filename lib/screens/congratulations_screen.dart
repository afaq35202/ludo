import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlueColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/congratulations.png",
            ),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/congratulations_text.png"),
            Text("YOU\nWON",textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                const Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),)
          ],
        ),
      ),

    );
  }
}
