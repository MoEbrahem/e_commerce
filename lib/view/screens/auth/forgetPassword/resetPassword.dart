import 'package:ecommerce_app/controller/forgetPassword/resetPassword_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextformauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(ResetPasswordControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "39".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.grey),
            ),
          ),
          
          body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller)=>
            HandlingDataRequest(
            statusrequest: controller.statusrequest ,
            widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            margin: const EdgeInsets.only(top: 20),
            child: Form(
              key: controller.formState,
              child: ListView(children: [
                 CustomTextTitleAuth(title: "41".tr),
                const SizedBox(
                  height: 20,
                ),
                CustomTextBodyAuth(body: "40".tr),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormAuth(
                  isEmail: false,

                  isNumber: false,
                  valid: (val) {
                    return ValidInput(val!, 5, 30, 'password');
                  },
                  mycontroller: controller.password,
                  labletext: "41".tr,
                  hinttext: "7".tr,
                  iconData: Icons.password,
                ),
                CustomTextFormAuth(
                  isEmail: false,
                  isNumber: false,
                  valid: (val) {
                    return ValidInput(val!, 5, 30, 'password');
                  },
                  mycontroller: controller.repassword,
                  labletext: "41".tr,
                  hinttext: "42".tr,
                  iconData: Icons.password,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonAuth(
                  text: '43'.tr,
                  onPressed: () {
                    controller.Save();
                  },
                ),
              ]),
            ),
          ),
        )
      ),
    )
  );
}
}
