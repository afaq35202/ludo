import 'package:flutter/material.dart';
import 'package:ludo/utils/app_colors.dart';
import 'package:ludo/widgets/custom_input_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: appBlueColor, width: 2),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: appLightBlueColor,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                image: const DecorationImage(
                    image: AssetImage("assets/person.png"), fit: BoxFit.fill)),
          ),
          const CustomInputField(
            heading: "Name",
          ),
        ],
      ),
    );
  }
}
