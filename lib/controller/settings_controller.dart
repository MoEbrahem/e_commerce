import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logOut() {
    String id = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("user");
    FirebaseMessaging.instance.unsubscribeFromTopic("user$id");
    myServices.sharedPreferences.remove("username");
    myServices.sharedPreferences.remove("email");
    Get.offAllNamed(AppRoute.login);
  }
}
