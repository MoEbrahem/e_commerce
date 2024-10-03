import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String textbutton;
  final bool active;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.iconData,
      required this.textbutton, required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,color: active==true ? AppColor.primaryColor : AppColor.grey2,size: 30,),
          // Text(
          //   textbutton,
          // style: TextStyle(color: active==true ? AppColor.primaryColor : AppColor.grey2,fontSize: 5),),
        ],
      ),
    );
  }
}
