// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  MyServices myServices = Get.find();

  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = SettingsController();
    String Name = myServices.sharedPreferences.getString('username').toString();
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                ),
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  padding: const EdgeInsets.all(4),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      AppImageAssets.ImageAssetsProfile,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: Get.height/15),
            child: Text(
              Name,
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: Get.height/17,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width/22),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Disable Notification"),
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.pending);
                    },
                    title: const Text("Orders"),
                    trailing: const Icon(Icons.shopping_cart_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.archive);
                    },
                    title: const Text("Archive"),
                    trailing: const Icon(Icons.archive_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("About us"),
                    trailing: const Icon(Icons.help_outline_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      launchUrl(
                        Uri.parse("tel:01210335687"),
                      );
                    },
                    title: const Text("Contact us"),
                    trailing: const Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logOut();
                    },
                    title: const Text("Log out"),
                    trailing: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
