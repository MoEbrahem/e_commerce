import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class TitleWidgetCheckOut extends StatelessWidget {
  final String title;
  const TitleWidgetCheckOut({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColor.secondColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
