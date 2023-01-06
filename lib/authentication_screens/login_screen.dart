import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/common.dart';
import '../widgets/custom_button_widget.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: Common.gradientBackground(screenBackgroundColor)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                const Spacer(),
                Image.asset("assets/two_dices_image.png"),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "LUDO",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/big_dice_image.png"),
                  Center(
                    child: CustomButtonWidget1(
                      buttonText: 'Login',
                      onClick: () {
                        Get.to(() => const OTPScreen());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
