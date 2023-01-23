import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_controllers/dashboard_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button_widget.dart';
class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find<DashboardController>();
    return WillPopScope(
      onWillPop: ()async{
        dashboardController.index.value = 0;
        Get.back();
        return false;
      },
      child: Scaffold(
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
              ),),
               CustomButtonWidget1(buttonText: 'Back To Home',onClick: (){
                 dashboardController.index.value = 0;
                 Get.back();
               },),
            ],
          ),
        ),

      ),
    );
  }
}
