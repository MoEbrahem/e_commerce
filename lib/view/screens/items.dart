import 'package:ecommerce_app/controller/Items_controller.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:ecommerce_app/view/widgets/CustomSearchappbar.dart';
import 'package:ecommerce_app/view/widgets/items/CustomListItems.dart';
import 'package:ecommerce_app/view/widgets/items/listCategoriesItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController favcontroller = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              Customappbar(
                mycontroller: controller.searchcontroller,
                title: '46'.tr,
                onpressedSearch: () {
                  controller.gotopageproductDetails(controller.listData);
                },
                onPressedIconFav: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const ListCategoriesItems(),
              HandlingDataView(
                statusrequest: controller.statusRequest,
                widget: GridView.builder(
                  itemCount: controller.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7,),
                  itemBuilder: (context, index) {
                    favcontroller
                            .isfavorite[controller.data[index]['items_id']] =
                        controller.data[index]['favorite'];

                    return CustomListItems(
                      itemsmodel: itemsModel.fromJson(controller.data[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
