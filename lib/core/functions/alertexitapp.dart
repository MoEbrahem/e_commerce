import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: 'هل تريد الخروج من هذا التطبيق',
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('OK')
            ),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel')
            ),
      ]);
  return Future.value(true);
}
