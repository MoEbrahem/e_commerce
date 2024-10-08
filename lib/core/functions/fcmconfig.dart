// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      print(
          "========================= Notification ==========================");
      print(message.notification!.title);
      print(message.notification!.body);
      FlutterRingtonePlayer().playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refreshPageNotification(message.data);
    },
  );
}

refreshPageNotification(data) {
  print("=====================================${data['pageid']}");
  print("=====================================${data['pagename']}");
  if (Get.currentRoute == '/pendingorder' &&
      data['pagename'] == "orderApprove") {
    PendingOrdersController controller = Get.find();
    controller.refreshOrder();
  }
}
