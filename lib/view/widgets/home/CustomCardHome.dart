import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String subtitle;
  const CustomCardHome(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.width / 20),
      child: Stack(
        children: [
          Container(
            height: Get.height / 4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(Get.width / 20),
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(
                  color: Color.fromARGB(208, 255, 255, 255),
                  fontSize: 21,
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: controller.lang == "en" ? -Get.width / 5 : null,
            left: controller.lang == "ar" ? -Get.width / 5 : null,
            child: Container(
              height: Get.height / 5,
              width: Get.height / 5,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(
                  Get.height / 4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
