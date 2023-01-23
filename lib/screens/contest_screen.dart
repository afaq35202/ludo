import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ludo/getx_controllers/contests_controller.dart';
import 'package:ludo/getx_controllers/dashboard_controller.dart';
import 'package:ludo/utils/app_colors.dart';

import '../data_models/responses/game_contests_response.dart';
import '../utils/common.dart';
import '../widgets/custom_button_widget.dart';

class ContestScreen extends StatelessWidget {
  final DashboardController dashboardController;

  const ContestScreen({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint("Game id is ${dashboardController.gameId}");
    final contestsController = Get.put(ContestsController(""));
    return WillPopScope(
      onWillPop: () async {
        dashboardController.index.value = 0;
        Get.delete<ContestsController>();
        return false;
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/button_background.png",
                    ),
                    fit: BoxFit.fill)),
            child: Center(
                child: Text(
              "Ludo Classic",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: customTextBodyColor.withOpacity(0.5)),
            )),
          ),
          Expanded(child: Obx(() {
            if (contestsController.isLoading.isTrue) {
              return Common.loader();
            } else {
              if(contestsController.checkResponse.isFalse){
                return Common.noDataFoundError("Something went wrong",context);
              }
              if(contestsController.gameContestsResponse.value.data!.isEmpty){
                return Common.noDataFoundError("No data found",context);
              }
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      contestsController.gameContestsResponse.value.data!.length,
                  itemBuilder: (context, index) {
                    return ListItem(
                        dashboardController: dashboardController,
                        datum: contestsController
                            .gameContestsResponse.value.data![index]!);
                  });
            }
          }))
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Datum datum;
  final DashboardController dashboardController;

  const ListItem(
      {Key? key, required this.dashboardController, required this.datum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: containerLightBgColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Table(
        border: const TableBorder(
          horizontalInside: BorderSide(color: Colors.white, width: 0.3),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                children: [
                  Text(
                    "₹${datum.entryFees}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Entry Fee",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: customTextBodyColor.withOpacity(0.5)),
                  ),
                ],
              ),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                children: [
                  Text(
                    "₹${datum.prize}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Prize",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: customTextBodyColor.withOpacity(0.5)),
                  ),
                ],
              ),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CustomButtonWidget2(
                onPressed: () {
                  dashboardController.index.value = 9;
                  dashboardController.datum.value = datum;
                },
                buttonText: 'Play',
              ),
            ))
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "30 Playing",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: customTextBodyColor.withOpacity(0.5)),
              ),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "10 Searching...",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: customTextBodyColor.withOpacity(0.5)),
              ),
            )),
            const TableCell(
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: SizedBox.shrink(),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
