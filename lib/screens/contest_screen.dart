import 'package:flutter/material.dart';
import 'package:ludo/utils/app_colors.dart';

import '../widgets/custom_button_widget.dart';

class ContestScreen extends StatelessWidget {
  final Function() onPlayButtonClick;
  const ContestScreen({Key? key,required this.onPlayButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: customTextBodyColor.withOpacity(0.5)),
          )),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
            return ListItem(onPlayButtonClick: onPlayButtonClick);
          }),
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final Function() onPlayButtonClick;
  const ListItem({Key? key,required this.onPlayButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: containerLightBgColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(top:10,right: 10,left: 10),
      child: Table(
        border: const TableBorder(horizontalInside: BorderSide(color: Colors.white,width: 0.3),),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              children: [
            TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
              children: [
                  Text(
                    "₹50",
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
                    "₹90",
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
                  child: CustomButtonWidget2(onPressed: onPlayButtonClick, buttonText: 'Play',),
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
