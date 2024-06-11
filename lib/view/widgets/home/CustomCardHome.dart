import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String subtitle;
  const CustomCardHome({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                title,
                style:const TextStyle(
                  color: Colors.white, 
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                  ),
              ),
              subtitle: Text(
                subtitle,
                  style:const TextStyle(
                      color: Color.fromARGB(208, 255, 255, 255), fontSize: 21)),
            ),
          ),
          Positioned(
            top: -60,
            right:controller.lang == "en" ? -50 : null,
            left: controller.lang == "ar" ? -50 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}
