import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/Items_controller.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final itemsModel itemsmodel;
  const CustomListItems({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        controller.gotopageproductDetails(itemsmodel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsmodel.itemsId}",
                    child: CachedNetworkImage(
                      height: h * 0.10,
                      width: h * 0.3,
                      fit: BoxFit.fill,
                      imageUrl:
                          "${AppLink.itemsImage}/${itemsmodel.itemsImage}",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${translateDatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: const Icon(
                            Icons.timer_sharp,
                            color: AppColor.grey,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${controller.deliverytime} Minute",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans',
                        ),
                        textAlign: TextAlign.center,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GetBuilder<FavoriteController>(builder: (favcontroller) {
                        return HandlingDataView(
                          statusrequest: controller.statusRequest,
                          widget: IconButton(
                            onPressed: () {
                              if (favcontroller
                                          .isfavorite[itemsmodel.itemsId] ==
                                      0 ||
                                  favcontroller.isfavorite.isEmpty) {
                                favcontroller.setfavorite(
                                    itemsmodel.itemsId, 1);
                                favcontroller
                                    .addFavorite(itemsmodel.itemsId.toString());
                              } else {
                                favcontroller.setfavorite(
                                    itemsmodel.itemsId, 0);
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
