import 'package:ecommerce_app/controller/productDetails_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class subitemproductdetails extends GetView<ProductdetailsControllerImp> {
  const subitemproductdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                    ...List.generate(
                controller.subitems.length, 
                (index) => Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 5),
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                      color: controller.subitems[index]['active']=="1" ?
                        AppColor.fourthColor: Colors.white,
                        border: Border.all(color: AppColor.fourthColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      controller.subitems[index]['name'],
                      style: TextStyle(
                        color: controller.subitems[index]['active']=="1" 
                         ? Colors.white :AppColor.fourthColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
          );
  }
}