import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offer_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListOfferItems extends GetView<OfferController> {
  final itemsModel itemsmodel;
  const CustomListOfferItems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsmodel.itemsId}",
                    child: CachedNetworkImage(
                      height: 110,
                      width: 130,
                      // fit: BoxFit.fill,
                      imageUrl:
                          "${AppLink.itemsImage}/${itemsmodel.itemsImage}",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${translateDatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
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
                        "${itemsmodel.itemspricediscount}\$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontFamily: "sans",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (favcontroller) {
                        return IconButton(
                          onPressed: () {
                            if (favcontroller.isfavorite[itemsmodel.itemsId] ==
                                0) {
                              favcontroller.setfavorite(itemsmodel.itemsId, 1);
                              favcontroller
                                  .addFavorite("${itemsmodel.itemsId}");
                            } else {
                              favcontroller.setfavorite(itemsmodel.itemsId, 0);
                              favcontroller
                                  .removeFavorite("${itemsmodel.itemsId}");
                            }
                          },
                          icon: Icon(
                            favcontroller.isfavorite[itemsmodel.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_outline_outlined,
                            color: AppColor.primaryColor,
                          ),
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
            if (itemsmodel.itemsDiscount != 0)
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppImageAssets.sale,
                    width: 40,
                  ))
          ],
        ),
      ),
    );
  }
}
