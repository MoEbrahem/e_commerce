import 'package:ecommerce_app/controller/onboardingController.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<onboardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  onboardingList[i].image,
                  //width: 290,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 30),
                Text(
                  onboardingList[i].title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onboardingList[i].body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 2,
                        color: AppColor.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ));
  }
}
