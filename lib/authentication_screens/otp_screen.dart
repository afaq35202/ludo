import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ludo/widgets/custom_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../screens/dashboard_screen.dart';
import '../utils/app_colors.dart';
import '../utils/common.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: Common.gradientBackground(allScreensBgColor)),
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  Image.asset("assets/single_dice_image.png")
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
                      height: 100,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                  color: customTextFieldDarkColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "+91",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: customTextBlueColor),
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: customTextBodyColor,
                              decoration: InputDecoration(
                                  hintText: "Enter Mobile No.",
                                  contentPadding: const EdgeInsets.all(5),
                                  hintStyle: TextStyle(
                                      color:
                                          customTextBlueColor.withOpacity(0.5)),
                                  fillColor: customTextFieldColor,
                                  filled: true,
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: customTextFieldColor)),
                                  disabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: customTextFieldColor)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: customTextFieldColor)),
                                  errorBorder:
                                      const OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)), borderSide: BorderSide(color: customTextFieldColor)),
                                  focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)), borderSide: BorderSide(color: customTextFieldColor)),
                                  focusedErrorBorder: const OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)), borderSide: BorderSide(color: customTextFieldColor))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: PinCodeTextField(
                        textStyle: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 6,
                        pinTheme: PinTheme(
                            activeColor: customTextFieldColor,
                            borderRadius: BorderRadius.circular(10),
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 40,
                            fieldWidth: 30,
                            borderWidth: 1.0,
                            inactiveColor: Colors.white,
                            activeFillColor: Colors.white),
                        onChanged: (code) {},
                      ),
                    ),
                    CustomButtonWidget1(
                        buttonText: "Get Otp",
                        onClick: () {
                          Get.to(() => const DashboardScreen());
                        }),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
