// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:ecommerce_app/controller/homeScreen_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/home/CustomBottomAppBarHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.mycart);
          },
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(
          child: controller.listpages.elementAt(controller.currentpage),
          onWillPop: () {
            Get.defaultDialog(
              title: "Warning",
              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
              middleText: "Do You Want to Exit The App?",
              buttonColor: AppColor.thirdColor,
              onCancel: () {},
              onConfirm: () {
                exit(0);
              },
              confirmTextColor: AppColor.secondColor,
              cancelTextColor: AppColor.secondColor,
            );
            return Future.value(false);
          },
        ),
      ),
    );
  }
}



// Row(
                    //   children: [
                    //     CustomButtonAppBar(
                    //         onPressed: () {
                    //           controller.changepage(0);
                    //         },
                    //         iconData: Icons.home,
                    //         textbutton: "Home",
                    //         active: controller.currentpage == 0 ? true : false),
                    //     CustomButtonAppBar(
                    //         onPressed: () {
                    //           controller.changepage(1);
                    //         },
                    //         iconData: Icons.settings,
                    //         textbutton: "Settings",
                    //         active: controller.currentpage == 1 ? true : false),
                    //   ],
                    // ),
                    // const Spacer(),
                    // Row(children: [
                    //   CustomButtonAppBar(
                    //       onPressed: () {
                    //         controller.changepage(2);
                    //       },
                    //       iconData: Icons.person,
                    //       textbutton: "Profile",
                    //       active: controller.currentpage == 2 ? true : false),
                    //   CustomButtonAppBar(
                    //       onPressed: () {
                    //         controller.changepage(3);
                    //       },
                    //       iconData: Icons.favorite_outline,
                    //       textbutton: "Favourite",
                    //       active: controller.currentpage == 3 ? true : false),
                    // ]),