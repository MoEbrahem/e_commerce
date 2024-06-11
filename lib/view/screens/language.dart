import 'package:ecommerce_app/core/localization/LocaleController.dart';
import 'package:ecommerce_app/view/widgets/Language/customButtonLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLanguage(
              textButton: "العربية",
              onPressed: () {
                controller.onchangelang("ar");
                Get.toNamed('onBoarding');
              },
            ),
            CustomButtonLanguage(
              textButton: "English",
              onPressed: () {
                controller.onchangelang("en");
                Get.toNamed('onBoarding');
              },
            )
          ],
        ),
      ),
    );
  }
}
