import 'package:ecommerce_app/controller/onboardingController.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customDotController extends StatelessWidget {
  const customDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onboardingControllerImp>(
      builder: (controller)=>Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboardingList.length, 
                  (index) => AnimatedContainer(                             
                  duration: const Duration(milliseconds: 900),
                  margin: const EdgeInsets.only(right: 5),
                  width: controller.currentPage == index ? 20 : 5 ,
                  height: 6,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primaryColor,
                  ),
                  )
                  ),
      ],
          ),
);  
    }
}