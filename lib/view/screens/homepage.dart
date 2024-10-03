import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/home/CustomCardHome.dart';
import 'package:ecommerce_app/view/widgets/CustomSearchappbar.dart';
import 'package:ecommerce_app/view/widgets/home/CustomTitleHome.dart';
import 'package:ecommerce_app/view/widgets/home/ListItemSearch.dart';
import 'package:ecommerce_app/view/widgets/home/ListItemsHome.dart';
import 'package:ecommerce_app/view/widgets/home/listCategoriesHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding:  EdgeInsets.only(left: Get.width/30,right: Get.width/30),
        child: ListView(
          children: [
            Customappbar(
              mycontroller: controller.searchcontroller,
              title: '46'.tr,
              onChanged: (val) {
                controller.checkSearching(val);
              },
              onpressedSearch: () {
                if (controller.searchcontroller != null) {
                  controller.onPressedSearch();
                }
              },
              onPressedIconFav: () {
                Get.toNamed(AppRoute.myfavorite);
              },
            ),
            HandlingDataView(
              statusrequest: controller.statusRequest,
              widget: controller.isSearching
                  ? ListItemSearch(
                      listdataModel: controller.listData,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardHome(
                          title: controller.hometitle,
                          subtitle: controller.homebody,
                        ),
                        CustomTitleHome(title: "49".tr),
                        const ListCategoriesHome(),
                         SizedBox(
                          height: Get.width/45,
                        ),
                        CustomTitleHome(title: "51".tr),
                         SizedBox(
                          height: Get.width/85,
                        ),
                        const ListItemsHome(),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
