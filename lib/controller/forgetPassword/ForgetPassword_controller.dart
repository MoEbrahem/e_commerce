import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/checkEmail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassword extends GetxController {
  // ignore: non_constant_identifier_names
  Checkemail();
}

class ForgetPasswordControllerImp extends ForgetPassword {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  Statusrequest statusrequest = Statusrequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  // ignore: non_constant_identifier_names
  Checkemail() async {
    if (formState.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();

      var response = await checkEmailData.postData(email.text);

      statusrequest = handlingData(response);

      if (statusrequest == Statusrequest.success) {
        if (response?['status'] == 'success') {
          Get.offNamed(AppRoute.verifyCode, arguments: {
            'email': email.text
          });
        } else {
          // statusrequest = Statusrequest.failure;
          Get.defaultDialog(title: 'Warning !!', middleText: 'Email Not Found');
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
