import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCartList extends StatelessWidget {
  final String itemsid;
  final String carttitle;
  final String price;
  final String counter;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomItemsCartList(
      {super.key,
      required this.carttitle,
      required this.price,
      required this.counter,
      required this.image,
      required this.itemsid,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      Expanded(
        flex: 2,
        child: CachedNetworkImage(
          height: Get.height/9,
          imageUrl: image,
        ),
      ),
      Expanded(
        flex: 3,
        child: ListTile(
          title: Text(
            carttitle,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          subtitle: Text(
            price,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "Sans",
            ),
          ),
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: Get.height/20,
            child: IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
            ),
          ),
          Container(
            color: Colors.white,
            height: Get.height/21,
            width: Get.width/13,
            child: Text(
              counter,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Sans",
                fontWeight: FontWeight.bold,
                color: AppColor.black,
              ),
            ),
          ),
          SizedBox(
            height: Get.height/20,
            child: IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
            ),
          ),
        ],
      )
    ]));
  }
}
