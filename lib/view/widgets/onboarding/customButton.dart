import 'package:ecommerce_app/controller/onboardingController.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<onboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        color: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          
          controller.next();
        },
        textColor: Colors.white,
        child:  Text("38".tr),
      ),
    );
  }
}
