import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  Save();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  String? email;
  Statusrequest statusrequest = Statusrequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Save() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
            title: 'Error !!',
            middleText: "Passwords don't Match.");
    }
    if (formState.currentState!.validate()) {
      
        statusrequest = Statusrequest.loading;
        update();
        var response = await resetPasswordData.postData(email, password.text);
        statusrequest = handlingData(response);
        if (statusrequest == Statusrequest.success) {
          if (response?['status'] == 'success') {
            Get.offNamed(AppRoute.successresetPassword);
          } else {
            statusrequest = Statusrequest.failure;
            Get.defaultDialog(
                title: 'Warning !!', middleText: "Try Again ");
          }
        }
        update();
      } 
    
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
