import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height/6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsmodel: itemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final itemsModel itemsmodel;
  const ItemsHome({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotopageproductDetails(itemsmodel);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width/38, vertical: Get.width/38),
            margin: EdgeInsets.symmetric(horizontal: Get.width/32),
            child: Image.network(
              '${AppLink.itemsImage}/${itemsmodel.itemsImage}',
              fit: BoxFit.fill,
              height: Get.height/3,
              width: Get.height/5.2,
            ),
          ),
          Container(
            height: 130,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            left: controller.lang == "en" ? 10 : null,
            right: controller.lang == "ar" ? 10 : null,
            child: Text(
              '${translateDatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}',
              maxLines: 1,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
