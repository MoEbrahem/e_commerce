import 'package:ecommerce_app/controller/myFavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/cart/topcardCart.dart';
import 'package:ecommerce_app/view/widgets/myfavorite/CustomListFavoriteItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        toolbarHeight: 55,
        centerTitle: true,
        title: const Text(
          'My Favourite',
          style: TextStyle(color: AppColor.whiteColor),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) {
            return ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TopCardCart(
                        title:
                            "You Have ${controller.data.length} Items in Favourite",
                      ),
                    ),
                    Container(
                      width: 45,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.thirdColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.mycart);
                        },
                        icon: const Icon(Icons.shopping_cart),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                HandlingDataView(
                  statusrequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItem(
                        favmodel: controller.data[index],
                      );
                    },
                  ),
                ),
                // : const Center(
                //   child: Text(
                //     "There is No favourite Items",
                //     style: TextStyle(
                //       color: AppColor.primaryColor,
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
