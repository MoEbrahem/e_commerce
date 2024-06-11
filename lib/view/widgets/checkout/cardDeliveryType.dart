import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isactive;
  const CardDeliveryType({super.key, required this.imagename, required this.title, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: isactive ? AppColor.secondColor : null,
        border: Border.all(
          color: AppColor.secondColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            color: isactive ? Colors.white : null,
            width: 60,
            imagename,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isactive ? Colors.white : AppColor.secondColor,
            ),
          ),
        ],
      ),
    );
  }
}
