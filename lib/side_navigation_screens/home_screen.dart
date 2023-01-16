import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ludo/getx_controllers/home_controller.dart';

import '../screens/contest_screen.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final Function()? onClickBack;
  const HomeScreen({Key? key,this.onClickBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final homeController = Get.put(HomeController());
    return  Obx(() {
      if (homeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: homeController.gamesResponse.value.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: onClickBack,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: containerLightBgColor,
                              borderRadius: BorderRadius.circular(28)),
                          height: 142.2,
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(homeController.gamesResponse.value.data![index]!.name!),
                                const Text("Classic"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment:Alignment.centerLeft,
                          child: Image.asset(
                            "assets/ludo_image.png",
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
