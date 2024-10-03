import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopCardCart extends StatelessWidget {
  final String title;
  const TopCardCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width/22),
      padding:  EdgeInsets.symmetric(horizontal: Get.width/85,vertical: Get.width/55),
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.secondColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
