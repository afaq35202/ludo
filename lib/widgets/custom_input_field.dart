import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final Widget? suffixWidget;
  final String? hintText;
  final TextEditingController? controller;

  const CustomInputField({Key? key, this.suffixWidget, this.hintText,this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
          fontSize: 18,
          color: customTextBodyColor.withOpacity(0.5),),
        isDense: true,
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: suffixWidget,
        suffixIconConstraints: const BoxConstraints(maxHeight: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23.5)

        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(23.5)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(23.5)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(23.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(23.5)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(23.5)
        )

      ),
    );
  }
}
