import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed ;
  const CustomButtonAuth({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30,right: 20,left: 20,),
      child: MaterialButton(
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(text,style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}
