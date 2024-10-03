import 'package:ecommerce_app/controller/auth/SignUp_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextformauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widgets/auth/textsignuporsignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(signupControllerImp());
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.backgroundcolor,
            appBar: AppBar(
              // leading: IconButton(
              //     onPressed: () {
              //       Get.toNamed("onBoarding");
              //     },
              //     icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              backgroundColor: AppColor.backgroundcolor,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "17".tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColor.grey),
              ),
            ),
            body: WillPopScope(
              onWillPop: AlertExitApp,
              child: GetBuilder<signupControllerImp>(
                  builder: (controller) => HandlingDataRequest(
                        statusrequest: controller.statusrequest,
                        widget: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          margin: const EdgeInsets.only(top: 20),
                          child: Form(
                            key: controller.formState,
                            child: ListView(children: [
                              CustomTextTitleAuth(title: "2".tr),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextBodyAuth(body: "16".tr),
                              const SizedBox(
                                height: 25,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return ValidInput(val!, 4, 50, 'username');
                                },
                                mycontroller: controller.username,
                                isEmail: false,
                                labletext: "12".tr,
                                hinttext: "13".tr,
                                iconData: Icons.person,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return ValidInput(val!, 8, 50, 'email');
                                },
                                mycontroller: controller.email,
                                isEmail: true,
                                labletext: "4".tr,
                                hinttext: "5".tr,
                                iconData: Icons.email_outlined,
                              ),
                              CustomTextFormAuth(
                                onTapIcon: () {
                                  controller.ShowPassword();
                                },
                                obscuretext: controller.isShowPassword,
                                isNumber: false,
                                isEmail: false,
                                valid: (val) {
                                  return ValidInput(val!, 6, 20, 'password');
                                },
                                mycontroller: controller.password,
                                labletext: "6".tr,
                                hinttext: "7".tr,
                                iconData: Icons.lock_outline_rounded,
                              ),
                              CustomTextFormAuth(
                                isNumber: true,
                                isEmail: false,
                                valid: (val) {
                                  return ValidInput(
                                      val!, 11, 20, 'PhoneNumber');
                                },
                                mycontroller: controller.phoneNumber,
                                labletext: "14".tr,
                                hinttext: "15".tr,
                                iconData: Icons.phone_android_rounded,
                              ),
                              CustomButtonAuth(
                                text: '17'.tr,
                                onPressed: () async {
                                  await controller.signup();
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomTextSignUpOrSignIn(
                                onTap: () {
                                  controller.onPressedLogin();
                                },
                                textone: "18".tr,
                                texttwo: "19".tr,
                              )
                            ]),
                          ),
                        ),
                      )),
            )));
  }
}
