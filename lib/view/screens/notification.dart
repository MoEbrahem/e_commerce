// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/controller/notificationOrder_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
      builder: (controller) => HandlingDataView(
        statusrequest: controller.statusrequest,
        widget: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                controller.data.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Stack(
                    children: [
                      ListTile(
                        title:
                            Text(controller.data[index]['notification_title']),
                        subtitle:
                            Text(controller.data[index]['notification_body']),
                      ),
                      Positioned(
                        right: 5,
                        child: Text(
                          Jiffy.parse(
                            controller.data[index]['notification_datetime'],
                          ).toNow(),
                          style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
