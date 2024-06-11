// ignore_for_file: file_names

import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/data/model/ordersModel.dart';
import 'package:ecommerce_app/view/widgets/orders/CustomRatingDilog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardArchiveOrdersList extends GetView<ArchiveOrdersController> {
  final OrdersModel listdata;
  const CardArchiveOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number: #${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold), // 25 years ago
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order Type: ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order Price: ${listdata.ordersPrice}\$"),
            Text("Delivery Price: ${listdata.ordersPricedelivery}\$ "),
            Text(
              "Payment Method: ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}",
            ),
            Text(
                "Order Status: ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price: ${listdata.ordersTotalprice}\$",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.secondColor),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.details, arguments: {
                      "orderModel": listdata,
                    });
                  },
                  color: AppColor.thirdColor,
                  child: const Text(
                    "Details",
                    style: TextStyle(color: AppColor.secondColor),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if(listdata.ordersRating == "0")MaterialButton(
                  onPressed: () {
                    showRatingDialog(context,listdata.ordersId!);
                  },
                  color: AppColor.thirdColor,
                  child: const Text(
                    "Rating",
                    style: TextStyle(color: AppColor.secondColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
