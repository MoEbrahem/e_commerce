import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/offer_data.dart';
import 'package:ecommerce_app/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferController extends SearchMixController {
  late Statusrequest statusrequest;
  OfferData offerData = OfferData(Get.find());
  List<itemsModel> data = [];

  getData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await offerData.getData();
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(
          listdata2.map(
            (e) => itemsModel.fromJson(e),
          ),
        );
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchcontroller = TextEditingController();
    getData();
    super.onInit();
  }
}
