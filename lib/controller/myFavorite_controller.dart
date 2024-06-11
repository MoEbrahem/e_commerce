// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavoriteData.dart';
import 'package:ecommerce_app/data/model/myFavoriteModel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];

  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  late Statusrequest statusRequest;

  getFavorite() async {
    data.clear();
    statusRequest = Statusrequest.loading;
    update();

    var response = await myfavoriteData
        .viewData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response?['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(
          responseData.map(
            (e) => MyFavoriteModel.fromJson(e),
          ),
        );
      }
      if (response?['status'] == 'failure') {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(int favid)  {
    var response = myfavoriteData.delete(favid);
    data.removeWhere(
      (element) => element.favoriteId == favid,
    );
    update();
  }

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }
}
