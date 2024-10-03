import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String body ;
  const CustomTextBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width/22),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
  }
}