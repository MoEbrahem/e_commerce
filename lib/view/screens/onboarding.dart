import 'package:ecommerce_app/controller/onboardingController.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/view/widgets/onboarding/customButton.dart';
import 'package:ecommerce_app/view/widgets/onboarding/DotController.dart';
import 'package:ecommerce_app/view/widgets/onboarding/customSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onboardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  customDotController(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding(),
                ],
              ),
            )
          ],
        )));
  }
}
