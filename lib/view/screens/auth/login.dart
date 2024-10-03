// ignore_for_file: deprecated_member_use

import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextformauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:ecommerce_app/view/widgets/auth/logoAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/textsignuporsignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(loginControllerImp());
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
              "8".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.grey),
            ),
          ),
          body: WillPopScope(
            onWillPop: AlertExitApp,
            child: GetBuilder<loginControllerImp>(
              builder:(controller) => 
              HandlingDataRequest(
                statusrequest: controller.statusrequest ,
                widget: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                    const LogoAuth(),
                    CustomTextTitleAuth(title: "2".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextBodyAuth(body: "3".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return ValidInput(val!, 5, 30, 'email');
                      },
                      mycontroller: controller.email,
                      isEmail: true,
                      labletext: "4".tr,
                      hinttext: "5".tr,
                      iconData: Icons.email_outlined,
                      isNumber: false,
                    ),
                    CustomTextFormAuth(
                      obscuretext: controller.isshowPassword,
                      isNumber: false,
                      mycontroller: controller.password,
                      isEmail: false,
                      labletext: "6".tr,
                      hinttext: "7".tr,
                      iconData: Icons.lock_outline_rounded,
                      onTapIcon: (){
                        controller.ShowPassword();
                      },
                      
                      valid: (val) {
                        return ValidInput(val!, 5, 30, 'password');
                      },
                    
                    ),
                    InkWell(
                      onTap: () {
                        controller.gotoforgetPassword();
                      },
                      child: Text(
                        "9".tr,
                        style: const TextStyle(),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                      text: '8'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextSignUpOrSignIn(
                      onTap: () {
                        controller.onPressedSignUp();
                      },
                      textone: "10".tr,
                      texttwo: "11".tr,
                    )
                  ]),
                ),
              ),
            )
          ),
        )
      )
    );
  }
}
