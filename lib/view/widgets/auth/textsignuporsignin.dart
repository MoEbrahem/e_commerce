import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final Function()? onTap;
  const CustomTextSignUpOrSignIn(
      {super.key, required this.textone, required this.texttwo,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        SizedBox(
          width: Get.width/55,
        ),
        InkWell(
          onTap: onTap,
          
          child: Text(
            texttwo,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ),
      ],
    );
  }
}
