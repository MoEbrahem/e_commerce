import 'package:ecommerce_app/controller/auth/verifycodesignup_Controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignup extends StatelessWidget {
  const VerifyCodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    String email = Get.arguments['email'];
    Get.put(VerifyCodeSignupControllerImp());
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
          body: GetBuilder<VerifyCodeSignupControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView(children: [
                      CustomTextTitleAuth(title: "35".tr),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBodyAuth(body: '${"44".tr} $email'),
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
                          controller.gotoSuccessSignup(verificationCode);
                        },
                        // end onSubmit
                      ),
                      const SizedBox(height: 30,),
                      Center(
                        child: InkWell(
                          onTap: () {
                            controller.reSend();
                          },
                          child: const Text(
                            "Resend Verification Code",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ]),
                  )))),
    );
  }
}
