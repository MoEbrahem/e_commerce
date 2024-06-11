import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:ecommerce_app/view/widgets/cart/custom_bottom_navigationbar.dart';
import 'package:ecommerce_app/view/widgets/cart/customitemscartlist.dart';
import 'package:ecommerce_app/view/widgets/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustombottombarCart(
            shipping: "20",
            couponController: controller.couponController!,
            price: "${controller.totalprice}",
            discount: "${controller.discountcoupon}%",
            totalPrice: controller.getTotalPrice(),
            onApplyCoupon: () {
              controller.checkCoupon();
            },
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TopCardCart(
                    title:
                        "You Have ${controller.totalcount} Items in Your List"),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                          onAdd: () async {
                            await controller
                                .add(controller.data[index].itemsId.toString());
                            controller.refreshPage();
                          },
                          onRemove: () async {
                            await controller.delete(
                                controller.data[index].itemsId.toString());
                            controller.refreshPage();
                          },
                          itemsid: "${controller.data[index].itemsId}",
                          carttitle: "${controller.data[index].itemsName}",
                          price: "${controller.data[index].itemsPrice}\$",
                          counter: "${controller.data[index].countItems}",
                          image:
                              "${AppLink.itemsImage}/${controller.data[index].itemsImage}",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
