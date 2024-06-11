import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLanguage(
      {super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: onPressed,
          child: Text(
            textButton,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
