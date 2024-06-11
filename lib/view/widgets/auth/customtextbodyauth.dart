import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String body ;
  const CustomTextBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
  }
}