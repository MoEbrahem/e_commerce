import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class loginController extends GetxController {
  login();
  onPressedSignUp();
  gotoforgetPassword();
}

class loginControllerImp extends loginController {
  //List data = [];
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isshowPassword = true;

  ShowPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusrequest = handlingData(response);
      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            String id = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString('username', response['data']['users_name']);
            myServices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myServices.sharedPreferences.setString('step', '2');
            FirebaseMessaging.instance.subscribeToTopic("user");
            FirebaseMessaging.instance.subscribeToTopic("user$id");
            Get.offNamed(AppRoute.HomePage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignup,
                arguments: {'email': email.text});
          }
        } else {
          statusrequest = Statusrequest.failure;
          Get.defaultDialog(
              title: 'Warning !!', middleText: "Email OR Password is Wrong ");
        }
      }
      update();
    } else {
      return ' Not Valid';
    }
  }

  @override
  onPressedSignUp() {
    Get.toNamed(AppRoute.signup);
  }

  gotoforgetPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
