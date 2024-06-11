import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  final bool isactive;
  final String title;
  
  const CheckoutPaymentMethod({super.key, required this.isactive, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isactive == true ? AppColor.secondColor: AppColor.thirdColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          height: 1,
          color: isactive == true ? Colors.white : AppColor.secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
