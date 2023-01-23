import 'package:flutter/material.dart';
import 'package:ludo/utils/app_colors.dart';

class GamesHistory extends StatelessWidget {
  const GamesHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return customCard(context);
        });
  }

  Widget customCard(BuildContext context) {
    return Card(
      color: appLightBlueColor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            children: [
              TableRow(
                children: [
                  TableCell(child: Text("Game",textAlign: TextAlign.left,style: Theme.of(context).textTheme.bodyMedium,)),
                  TableCell(child: Text("Opponent",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,)),
                  TableCell(child: Text("Status",textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodyMedium,)),
                ]
              ),const TableRow(
                children: [
                  TableCell(child: SizedBox(height: 10,)),
                  TableCell(child: SizedBox(height: 10,)),
                  TableCell(child: SizedBox(height: 10,)),
                ]
              ),TableRow(
                children: [
                  TableCell(child: Text("Classic",textAlign: TextAlign.left,style: Theme.of(context).textTheme.bodySmall,)),
                  TableCell(child: Text("Vickey",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,)),
                  TableCell(child: Text("Won",textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodySmall,)),
                ]
              ),const TableRow(
                children: [
                  TableCell(child: SizedBox(height: 10,)),
                  TableCell(child: SizedBox(height: 10,)),
                  TableCell(child: SizedBox(height: 10,)),
                ]
              ),TableRow(
                children: [
                  TableCell(child: Text("",textAlign: TextAlign.left,style: Theme.of(context).textTheme.bodySmall,)),
                  TableCell(child: Text("Date",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,)),
                  TableCell(child: Text("1-3-23",textAlign: TextAlign.right,style: Theme.of(context).textTheme.bodySmall,)),
                ]
              ),
            ],
          ),
        )
      ),
    );
  }
}
