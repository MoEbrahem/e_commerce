import 'package:ecommerce_app/controller/forgetPassword/ForgetPassword_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextformauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(ForgetPasswordControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "34".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.grey),
            ),
          ),
          body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller)=>
            HandlingDataRequest(statusrequest: controller.statusrequest ,
            widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            // margin: const EdgeInsets.only(top: 20),
            child: Form(
              key: controller.formState,
              child: ListView(children: [
                CustomTextTitleAuth(title: "26".tr),
                const SizedBox(
                  height: 20,
                ),
                CustomTextBodyAuth(
                    body:
                        "33".tr
                        ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormAuth(
                  isEmail: true,
                  isNumber: false,
                  valid: (val) {
                    return ValidInput(val!, 5, 30, 'email');
                  },
                  mycontroller: controller.email,
                  labletext: "4".tr,
                  hinttext: "5".tr,
                  iconData: Icons.email_outlined,
                ),
                CustomButtonAuth(
                  text: '28'.tr,
                  onPressed: () {
                    controller.Checkemail();
                  },
                ),
                const SizedBox(height: 40,),
               ]
              ),
            ),
          )
        ),
      )
      )    
    );
  }
}
