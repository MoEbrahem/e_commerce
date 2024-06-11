import 'package:ecommerce_app/controller/myFavorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/CustomSearchappbar.dart';
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
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) {
            return ListView(
              children: [
                Customappbar(
                  title: "46".tr,
                  onpressedSearch: () {},
                  onPressedIconFav: () {
                    Get.toNamed(AppRoute.myfavorite);
                  },
                ),
                const SizedBox(height: 15),
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
                        itemsmodel: controller.data[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
