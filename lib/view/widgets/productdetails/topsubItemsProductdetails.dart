import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/productDetails_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductdetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Positioned(
          top: 30.0,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: "${controller.ItemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.itemsImage}/${controller.ItemsModel.itemsImage}",
              height: 200,
              width: 120,
            ),
          ),
        ),
      ],
    );
  }
}
