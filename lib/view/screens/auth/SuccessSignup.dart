import 'package:ecommerce_app/controller/auth/successsignup_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              color: AppColor.primaryColor,
              size: 200.0,
            )),
            CustomTextTitleAuth(title: "29".tr),
            const SizedBox(
              height: 40,
            ),
            CustomTextBodyAuth(body: "30".tr),
            const Spacer(),
            Container(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: "31".tr,
                  onPressed: () {
                    controller.gotoLogin();
                  },
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
