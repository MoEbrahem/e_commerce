import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class priceAndCount extends StatelessWidget {
  final void Function()? add;
  final void Function()? remove;
  final String price;
  final String count;

  const priceAndCount(
      {super.key,
      required this.add,
      required this.remove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: add,
              icon: const Icon(Icons.add),
            ),
            Container(
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.black),
              ),
              child: Text(
                textAlign: TextAlign.center,
                count,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(onPressed: remove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          '$price\$',
          style: const TextStyle(fontSize: 22, color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
