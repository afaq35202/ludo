import 'package:flutter/material.dart';
import 'package:ludo/utils/app_colors.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
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
            style: Theme.of(context).textTheme.bodyMedium,
          )),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
            return const ListItem();
          }),
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: containerLightBgColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Table(
        border: const TableBorder(bottom: BorderSide(color: Colors.white,width: 0.3),),
        children: [
          TableRow(children: [
            TableCell(
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
            )),
            TableCell(
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
            )),
            TableCell(
                child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white),
                  ))),
              onPressed: null,
              child: Text(
                "PLAY",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
            ))
          ])
        ],
      ),
    );
  }
}
