import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed ;
  const CustomButtonAuth({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.width/15,right: Get.width/55,left: Get.width/55,),
      child: MaterialButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width/18),
        ),
        padding:  EdgeInsets.symmetric(vertical: Get.width/27),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(text,style: TextStyle(fontSize: Get.width/22),),
      ),
    );
  }
}
