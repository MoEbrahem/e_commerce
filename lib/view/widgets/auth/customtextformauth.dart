import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData iconData;
  final String? Function(String?)? valid;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool isEmail;
  final bool? obscuretext;
  final Function()? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.hinttext,
    required this.labletext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    required this.isEmail,
    this.obscuretext,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.width/15),
      child: TextFormField(
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        keyboardType: isNumber == true
            ? const TextInputType.numberWithOptions(
                decimal: true,
              )
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        style: const TextStyle(color: AppColor.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: Get.width/35,
              horizontal: Get.width/12,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(
                iconData,
                color: AppColor.grey,
                size: Get.width/15,
              ),
            ),
            label: Container(
              margin:  EdgeInsets.symmetric(horizontal: Get.width/40),
              child: Text(
                labletext,
                style: const TextStyle(fontSize: 18, color: AppColor.grey),
              ),
            ),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width/15),
            )),
      ),
    );
  }
}
