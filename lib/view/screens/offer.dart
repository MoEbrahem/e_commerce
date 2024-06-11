// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offer_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/widgets/CustomSearchappbar.dart';
import 'package:ecommerce_app/view/widgets/home/ListItemSearch.dart';
import 'package:ecommerce_app/view/widgets/offer/CustomOfferList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          Customappbar(
            title: "Offers",
            onpressedSearch: () {
              if (controller.searchcontroller != null) {
                controller.onPressedSearch();
              }
            },
            onPressedIconFav: () => Get.toNamed(AppRoute.myfavorite),
          ),
          const SizedBox(
            height: 20,
          ),
          HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: GetBuilder<OfferController>(
              builder: (controller) => controller.isSearching != true ?  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CustomListOfferItems(
                  itemsmodel: controller.data[index],
                ),
              ): ListItemSearch(listdataModel: controller.listData)
            ),
          ),
        ],
      ),
    );
  }
}
