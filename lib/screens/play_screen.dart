import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ludo/data_models/models/play_game_model.dart';
import 'package:ludo/getx_controllers/contests_controller.dart';
import 'package:ludo/getx_controllers/play_game_controller.dart';
import 'package:ludo/widgets/custom_button_widget.dart';

import '../getx_controllers/dashboard_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_input_field.dart';
import 'congratulations_screen.dart';

class PlayScreen extends StatelessWidget {
  final DashboardController dashboardController;

  const PlayScreen({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playController = Get.put(PlayGameController(PlayGameModel(
        gameId: dashboardController.gameId.value,
        gameCategoryId: dashboardController.datum.value.id.toString(),
        gameStatus: "request")));
    return WillPopScope(
      onWillPop: () async {
        dashboardController.index.value = 0;
        Get.delete<PlayGameController>();
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 165,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/button_background.png",
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ludo Classic",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 30,
                            color: customTextBodyColor.withOpacity(0.5),
                          )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                    child: Divider(
                      color: customTextBodyColor.withOpacity(0.5),
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Entry Fee   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: customTextBodyColor.withOpacity(0.5),
                                  ),
                            ),
                            Text(
                              "₹${dashboardController.datum.value.entryFees}",
                              style: Theme.of(context).textTheme.bodyMedium!,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Prize   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: customTextBodyColor.withOpacity(0.5),
                                  ),
                            ),
                            Text(
                              "₹${dashboardController.datum.value.prize}",
                              style: Theme.of(context).textTheme.bodyMedium!,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  Center(child: SvgPicture.asset("assets/searching.svg")),
                  Obx(
                    () => Center(
                        child: playController.isLoading.isTrue
                            ? SvgPicture.asset("assets/searching_vector.svg")
                            : Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appGreenColor,
                                ),
                                width: 65,
                                height: 65,
                                child: const FittedBox(
                                    child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )),
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 35),
                    child: Column(
                      children: [
                        Image.asset("assets/girl_image.png"),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Parth",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 150,
                      right: 35,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          Image.asset("assets/girl_image.png"),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Parth",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() {
              if (playController.isLoading.isTrue) {
                return Text("Searching...",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: customTextBodyColor.withOpacity(0.5),
                        ));
              } else {
                return playController.playScreenViewAfterSearch.isFalse
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: CustomInputField(
                          hintText: "Enter Room ID",
                          controller: TextEditingController(),
                          suffixWidget: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: CustomButtonWidget2(
                              onPressed: () {
                                playController.playScreenViewAfterSearch.value =
                                    true;
                                playController.startTimer(15);
                              },
                              buttonText: "Done",
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            "Room ID: 56847512",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: customTextBodyColor.withOpacity(0.5),
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          playController.playScreenViewAfterWin.isFalse
                              ? SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButtonWidget2(
                                        onPressed: () {
                                          playController.playScreenViewAfterWin
                                              .value = true;
                                        },
                                        buttonText: "I WON",
                                        borderColor: Colors.transparent,
                                        radius: 8,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomButtonWidget2(
                                        onPressed: () {},
                                        buttonText: "I LOST",
                                        borderColor: Colors.transparent,
                                        color: Colors.red,
                                        radius: 8,
                                      ),
                                      Visibility(
                                        visible: playController.time.value.trim()!="01",
                                        child: const SizedBox(
                                          width: 10,
                                        ),
                                      ),
                                      Visibility(
                                        visible: playController.time.value.trim()!="01",
                                        child: CustomButtonWidget2(
                                          onPressed: () {},
                                          buttonText: "CANCEL ${playController.time.value}",
                                          borderColor: Colors.transparent,
                                          color: appYellowColor,
                                          radius: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: CustomInputField(
                                      hintText: "Attach Snap",
                                      suffixWidget: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: SvgPicture.asset(
                                            "assets/attach_icon.svg"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: CustomButtonWidget2(
                                      onPressed: () {
                                        Get.to(() =>
                                            const CongratulationsScreen());
                                        Get.delete<PlayGameController>();
                                        Get.delete<ContestsController>();
                                      },
                                      buttonText: "Submit",
                                      borderColor: Colors.transparent,
                                      horizontalPadding: 25,
                                    ),
                                  ),
                                ]),
                        ],
                      );
              }
            }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
