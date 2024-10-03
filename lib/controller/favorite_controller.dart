import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favoriteData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isfavorite = {};
  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  String? catid;
  late Statusrequest statusRequest;
  setfavorite(itemid, val) {
    isfavorite[itemid] = val;
    update();
  }

  addFavorite(String itemid) async {
    statusRequest = Statusrequest.loading;
    update();

    var response = await favoriteData.addData(
        myServices.sharedPreferences.getString("id")!, itemid);
    statusRequest = handlingData(response);
    if (statusRequest == Statusrequest.success) {
      if (response?['status'] == 'success') {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة الملف الى المفضلة"));
      }
      if (response?['status'] == 'failure') {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  removeFavorite(String itemid) async {
    statusRequest = Statusrequest.loading;
    update();

    var response = await favoriteData.removeData(
        myServices.sharedPreferences.getString("id")!, itemid);
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response?['status'] == 'success') {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف الملف من المفضلة"));
      }
      if (response?['status'] == 'failure') {
        statusRequest = Statusrequest.failure;
          Get.rawSnackbar(
            title: "اشعار", messageText: const Text("حدث خطأ"));
      
      }
    }
    update();
  }
}
