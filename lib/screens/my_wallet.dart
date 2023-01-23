import 'package:flutter/material.dart';
import 'package:ludo/widgets/custom_button_widget.dart';
class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Text("Total Balance",style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: 25,),
        Text("0",style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(height: 25,),
        CustomButtonWidget2(onPressed: (){}, buttonText: 'Add Cash',borderColor: Colors.transparent,horizontalPadding: 50,),
      ],
    );
  }
}
