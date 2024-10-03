import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/loGo.png",
      
      height: Get.height/5.5,

      );
  }
}