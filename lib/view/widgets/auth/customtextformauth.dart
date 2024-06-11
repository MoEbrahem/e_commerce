import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData iconData;
  final String? Function(String?)? valid;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obscuretext;
  final Function()? onTapIcon ;


  const CustomTextFormAuth({
    super.key,
    required this.hinttext,
    required this.labletext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.obscuretext,  
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        keyboardType: isNumber == true
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 37),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(
                iconData,
                color: AppColor.grey,
                size: 20,
              ),
            ),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                labletext,
                style: const TextStyle(fontSize: 18, color: AppColor.grey),
              ),
            ),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
