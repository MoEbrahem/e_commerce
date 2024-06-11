// ignore_for_file: non_constant_identifier_names, file_names

import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cartData.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController {
  InitialData();
  add(String itemsid);
  delete(String itemsid);
  getcountItems(String itemsid);
}

class ProductdetailsControllerImp extends ProductdetailsController {
  late itemsModel ItemsModel;
  late Statusrequest statusrequest;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  int countitems = 0;

  List subitems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "blue", "id": "2", "active": "1"},
    {"name": "black", "id": "3", "active": "0"},
  ];

  @override
  add(String itemsid) async {
    statusrequest = Statusrequest.loading;
    update();
    var responseAdd = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(responseAdd);
    if (statusrequest == Statusrequest.success) {
      if (responseAdd['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة الملف الى السلة"));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  delete(String itemsid) async {
    statusrequest = Statusrequest.loading;
    update();
    var responseDel = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(responseDel);
    if (statusrequest == Statusrequest.success) {
      if (responseDel['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم ازالة الملف من السلة"));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  addition() {
    add(ItemsModel.itemsId.toString());
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      delete(ItemsModel.itemsId.toString());
      countitems--;
      update();
    }
  }

  @override
  getcountItems(String itemsid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        
        countitems = int.parse(response['data'].toString());

        return countitems;
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    InitialData();
    super.onInit();
  }

  @override
  InitialData() async {
    statusrequest = Statusrequest.loading;
    update();
    ItemsModel = Get.arguments['itemsModel'];
    countitems = await getcountItems(ItemsModel.itemsId.toString());
    statusrequest = Statusrequest.success;
    update();
  }
}
