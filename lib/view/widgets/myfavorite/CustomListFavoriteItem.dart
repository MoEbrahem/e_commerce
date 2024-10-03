import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/myFavorite_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/myFavoriteModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItem extends GetView<MyFavoriteController> {
  final MyFavoriteModel favmodel;
  const CustomListFavoriteItem({
    super.key,
    required this.favmodel,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        controller.gotopageproductDetails(favmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: h * 0.121,
                width: h * 0.2,
                fit: BoxFit.fill,
                imageUrl: "${AppLink.itemsImage}/${favmodel.itemsImage}",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${translateDatabase(favmodel.itemsNameAr, favmodel.itemsName)}",
                maxLines: 1,
                
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "52".tr,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 22,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favmodel.itemsPrice}\$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontFamily: "sans",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(favmodel.favoriteId!);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColor.secondColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
