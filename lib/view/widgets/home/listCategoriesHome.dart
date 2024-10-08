// ignore_for_file: deprecated_member_use

import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/categoriesModel.dart';
import 'package:ecommerce_app/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoitems(
          controller.categories,
          i,
          categoriesModel.categoriesId.toString(),
        );

      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.network(
              '${AppLink.categoriesImage}/${categoriesModel.categoriesImage}',
              height: 50,
              color: AppColor.secondColor,
            ),
          ),
          Text(
            '${translateDatabase(
              categoriesModel.categoriesNameAr,
              categoriesModel.categoriesName,
            )}',
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ],
      ),
    );
  }
}
