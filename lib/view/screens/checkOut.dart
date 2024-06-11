// ignore_for_file: file_names

import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/checkout/CardShippingAddress.dart';
import 'package:ecommerce_app/view/widgets/checkout/cardDeliveryType.dart';
import 'package:ecommerce_app/view/widgets/checkout/checkoutPaymentMethod.dart';
import 'package:ecommerce_app/view/widgets/checkout/checkoutTitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController checkOutController = Get.put(CheckOutController());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: const EdgeInsets.all(10),
        height: 50,
        color: AppColor.secondColor,
        child: MaterialButton(
          onPressed: () {
            checkOutController.checkout();
          },
          child: const Text(
            "Check Out",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: GetBuilder<CheckOutController>(
        builder: (controller) => HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const TitleWidgetCheckOut(title: "Choose Payment Method"),
                InkWell(
                  onTap: () {
                    controller.checkPaymentMethod("0"); // 0 => cash
                  },
                  child: CheckoutPaymentMethod(
                    title: "Cash",
                    isactive: controller.paymentMethod == "0" ? true : false,
                  ),
                ),
                InkWell(
                    onTap: () {
                      controller.checkPaymentMethod("1"); // 1 => card
                    },
                    child: CheckoutPaymentMethod(
                      title: "Payment Cards",
                      isactive: controller.paymentMethod == "1" ? true : false,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const TitleWidgetCheckOut(title: "Choose Delivery Type"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.checkdeliveryType("0"); // 0 => delivery
                      },
                      child: CardDeliveryType(
                        imagename: AppImageAssets.deliverybike,
                        title: "Delivery",
                        isactive: controller.deliveryType == "0" ? true : false,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        controller.checkdeliveryType("1"); // 1 => instore
                      },
                      child: CardDeliveryType(
                        imagename: AppImageAssets.shop,
                        title: "Pickup",
                        isactive: controller.deliveryType == "1" ? true : false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.deliveryType == "0")
                  Column(
                    children: [
                      if(controller.listModelAddress.isNotEmpty)
                      const TitleWidgetCheckOut(title: "Shipping Address"),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.listModelAddress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.addAddress);
                          },
                          child: Container(
                            child: const Center(
                              child: Text(
                                "Please Add Your Address",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ...List.generate(
                        controller.listModelAddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.checkShippingAddress(controller
                                .listModelAddress[index].addressId
                                .toString());
                          },
                          child: CardShippingAddressCheckOut(
                            title:
                                "${controller.listModelAddress[index].addressName}",
                            body:
                                "${controller.listModelAddress[index].addressStreet} , ${controller.listModelAddress[index].addressCity}",
                            isactive: controller.addressId ==
                                    controller.listModelAddress[index].addressId
                                        .toString()
                                ? true
                                : false,
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
