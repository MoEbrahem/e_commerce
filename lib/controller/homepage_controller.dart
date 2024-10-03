import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/HomeData.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  gotoitems(List Categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? email;
  String? lang;
  List items = [];
  List categories = [];
  List settings = [];
  String hometitle = '';
  String homebody = '';
  String deliverytime = '';
  late Statusrequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("Lang");
    username = myServices.sharedPreferences.getString('username');
    email = myServices.sharedPreferences.getString('email');
  }

  @override
  void onInit() {
    searchcontroller = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await homeData.getData();

    print('==============================Controller $response');

    statusRequest = handlingData(response);
    if (statusRequest == Statusrequest.success) {
      if (response?['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settings.addAll(response['settings']['data']);
        hometitle = translateDatabase(
          settings[0]['settings_HomeTitle_AR'],
          settings[0]['settings_HomeTitle'],
        );
        homebody = translateDatabase(
          settings[0]['settings_HomeBody_AR'],
          settings[0]['settings_HomeBody'],
        );
        deliverytime = settings[0]['settings_DeliveryTime'].toString();
        myServices.sharedPreferences.setString("deliverytime", deliverytime);
      } else {
        return Statusrequest.failure;
      }
    }
    update();
  }

  @override
  // ignore: non_constant_identifier_names
  gotoitems(Categories, selectedCat, categoryid) {
    Get.toNamed(
      AppRoute.Items,
      arguments: {
        "categories": Categories,
        "selectedCat": selectedCat,
        "catid": categoryid,
      },
    );

  }
}

class SearchMixController extends GetxController {
  bool isSearching = false;
  TextEditingController? searchcontroller;

  List<itemsModel> listData = [];
  late Statusrequest statusRequest;

  HomeData homeData = HomeData(Get.find());

  gotopageproductDetails(ItemsModel) {
    Get.toNamed(
      AppRoute.productDetails,
      arguments: {
        'itemsModel': ItemsModel,
      },
    );
  }

  checkSearching(String val) {
    if (val == '') {
      statusRequest = Statusrequest.none;
      isSearching = false;
    }
    update();
  }

  onPressedSearch() {
    isSearching = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await homeData.searchData(searchcontroller!.text);

    statusRequest = handlingData(response);
    if (statusRequest == Statusrequest.success) {
      if (response?['status'] == 'success') {
        listData.clear();
        List responsedata = response['data'];
        listData.addAll(
          responsedata.map((e) => itemsModel.fromJson(e)),
        );
      } else {
        return Statusrequest.failure;
      }
    }
    update();
  }
}
