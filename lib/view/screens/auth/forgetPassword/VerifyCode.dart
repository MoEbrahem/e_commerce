import 'package:ecommerce_app/controller/forgetPassword/verifycode_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.grey),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            margin: const EdgeInsets.only(top: 20),
            child: ListView(children: [
               CustomTextTitleAuth(title: "35".tr),
              const SizedBox(
                height: 20,
              ),
               CustomTextBodyAuth(
                  body:
                      "Please Enter The Digit Code Sent To ${controller.email}"),
              const SizedBox(
                height: 25,
              ),
              OtpTextField(
                
                fieldWidth: 50,
                
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.gotoresetPassword(verificationCode);
                },
                // end onSubmit
              ),
            ]),
          )),
    );
  }
}
