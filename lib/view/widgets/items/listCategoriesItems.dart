import 'package:ecommerce_app/controller/Items_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onCatChanged(i,categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColor.primaryColor, width: 3)))
                        : null,
                    child: Text(
                      '${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}',
                      style:
                          const TextStyle(fontSize: 18, color: AppColor.grey2),
                    ),
                  )),
        ],
      ),
    );
  }
}
