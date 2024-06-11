import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class onboardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class onboardingControllerImp extends onboardingController {
  late PageController pageController;

  int currentPage = 0;
  
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
      myServices.sharedPreferences.setString('step', '1');
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
