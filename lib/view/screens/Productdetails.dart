import 'package:ecommerce_app/controller/productDetails_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/productdetails/priceandcount.dart';
import 'package:ecommerce_app/view/widgets/productdetails/subitemsDetails.dart';
import 'package:ecommerce_app/view/widgets/productdetails/topsubItemsProductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductdetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.secondColor,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 45,
          child: MaterialButton(
            color: AppColor.secondColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Get.toNamed(AppRoute.mycart);
            },
            child: const Text(
              "Go to Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductdetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const topProductPageDetails(),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.ItemsModel.itemsName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: AppColor.fourthColor)),
                            const SizedBox(
                              height: 10,
                            ),
                            priceAndCount(
                              count: "${controller.countitems}",
                              price:
                                  "${controller.ItemsModel.itemspricediscount}",
                              add: controller.addition,
                              remove: controller.remove,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${controller.ItemsModel.itemsDesc} ${controller.ItemsModel.itemsDesc} ${controller.ItemsModel.itemsDesc} ${controller.ItemsModel.itemsDesc} ${controller.ItemsModel.itemsDesc} ${controller.ItemsModel.itemsDesc}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: AppColor.fourthColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const subitemproductdetails(),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
