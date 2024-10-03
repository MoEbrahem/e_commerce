import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/view/widgets/cart/buttonCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombottombarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final double totalPrice;
  final String shipping;

  final TextEditingController couponController;
  final Function()? onApplyCoupon;

  const CustombottombarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    required this.couponController,
    this.onApplyCoupon,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: couponController,
                            decoration: InputDecoration(
                                hintText: "Coupon Code",
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                  left: Get.width/20,
                                  bottom: Get.width/25,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(Get.width/35))),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCart(
                          
                            onPressed: onApplyCoupon,
                            textButton: "apply",
                            
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(Get.width/35),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //   border: Border.all(
                    //     width: 1,
                    //     color: AppColor.primaryColor,
                    //   ),
                    // ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your coupon is  Correct",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.all(Get.width/35),
            padding:  EdgeInsets.symmetric(horizontal: Get.width/20,vertical:Get.width/35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width/32),
              border: Border.all(
                color: AppColor.primaryColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$price\$',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Text(
                      discount,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      shipping,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                      ),
                    ),
                  ],
                ),
                 const Divider(
                   color: Colors.black,
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                        color: AppColor.secondColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                      ),
                    ),
                    Text(
                      '$totalPrice\$',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans",
                        color: AppColor.secondColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           SizedBox(
            height: Get.height/95,
          ),
          CustomButtonCart(
            textButton: "Order",
            onPressed: () {
              controller.gotoPageCheckOut();
            },
          ),
        ],
      ),
    );
  }
}
