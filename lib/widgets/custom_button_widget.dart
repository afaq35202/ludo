import 'package:flutter/material.dart';
class CustomButtonWidget1 extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  const CustomButtonWidget1({Key? key,required this.buttonText,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          height: 90,
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
          width: MediaQuery.of(context).size.width/1.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage("assets/button_background.png"),
                fit: BoxFit.fill),
          ),
          child: FittedBox(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )),
    );
  }
}
