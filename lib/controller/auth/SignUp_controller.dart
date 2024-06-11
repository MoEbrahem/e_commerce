import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class signupController extends GetxController {
  signup();
  onPressedLogin();
}

class signupControllerImp extends signupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phoneNumber;

  Statusrequest statusrequest =Statusrequest.none;

  SignupData signupData = SignupData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  List data = [];

  ShowPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    if (formState.currentState!.validate()) {

      statusrequest = Statusrequest.loading;
      update();  
      var response = await signupData.postData(
          username.text, password.text, email.text, phoneNumber.text
          );
      statusrequest = handlingData(response);
      if (statusrequest == Statusrequest.success) {
        if (response?['status'] == 'success') {
          data.add(response?['data']);
          Get.offNamed(AppRoute.verifyCodeSignup, arguments: {"email" : email.text});
        } else {
          statusrequest = Statusrequest.failure;
          Get.defaultDialog(
              title: 'Warning !!',
              middleText: "Phone Number or Email Already Exist ");
        }
      }
      update();
    } else {
      return ' InValid';
    }
  }

  @override
  onPressedLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
}
