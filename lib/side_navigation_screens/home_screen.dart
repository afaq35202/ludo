import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo/getx_controllers/home_controller.dart';

import '../getx_controllers/dashboard_controller.dart';
import '../utils/app_colors.dart';
import '../utils/common.dart';

class HomeScreen extends StatelessWidget {
  final DashboardController dashboardController;

  const HomeScreen({Key? key, required this.dashboardController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: appBlueColor,
      onRefresh: ()async{
        homeController.onInit();
      },
      child: Obx(() {
        if (homeController.isLoading.value) {
          return Common.loader();
        } else {
          if(homeController.checkResponse.isFalse){
            return Common.noDataFoundError("Something went wrong",context);
          }
          if(homeController.gamesResponse.value.data!.isEmpty){
            return Common.noDataFoundError("No data found",context);
          }
          return ListView.builder(
              itemCount: homeController.gamesResponse.value.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    dashboardController.index.value = 8;
                    dashboardController.gameId.value = homeController.gamesResponse.value
                        .data![index]!.id.toString();
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                                  Text(
                                    Common.splitText(
                                        homeController.gamesResponse.value
                                            .data![index]!.name!,
                                        " ")[1],
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    Common.splitText(
                                            homeController.gamesResponse.value
                                                .data![index]!.name!,
                                            " ")
                                        .first,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              "assets/ludo_image.png",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Stack(
                                children: [
                                  // Implement the stroke
                                  Text(
                                      Common.splitText(
                                              homeController.gamesResponse.value
                                                  .data![index]!.name!,
                                              " ")
                                          .first,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 8
                                              ..color = appBlueColor,
                                          )),
                                  // The text inside
                                  Text(
                                      Common.splitText(
                                              homeController.gamesResponse.value
                                                  .data![index]!.name!,
                                              " ")
                                          .first,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          )),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
