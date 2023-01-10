import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButtonWidget1 extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const CustomButtonWidget1(
      {Key? key, required this.buttonText, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          height: 90,
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/button_background.png"),
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

class CustomButtonWidget2 extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final Color? color;
  final double? radius;
  final Color? borderColor;
  final double? horizontalPadding;

  const CustomButtonWidget2(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.color,
        this.borderColor,
        this.horizontalPadding,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: horizontalPadding??15)),
          backgroundColor: MaterialStateProperty.all(color ?? appGreenColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 18.0),
                side: BorderSide(color: borderColor??Colors.white),
          ))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
      ),
    );
  }
}
