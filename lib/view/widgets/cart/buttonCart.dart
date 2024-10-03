import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.symmetric(horizontal: Get.width/22,),
      child: MaterialButton(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(horizontal: Get.width/22,vertical: Get.width/40),
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
