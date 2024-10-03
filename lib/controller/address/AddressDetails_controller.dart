import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address.dart';
import 'package:ecommerce_app/data/model/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  Statusrequest statusrequest = Statusrequest.none;
  String? lat;
  String? long;
  List<AddressModel> data = [];
  AddressData addressData = AddressData(Get.find());
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addAddress() async {
    if(formState.currentState!.validate()){
      
    statusrequest = Statusrequest.loading;
    update();
    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id").toString(),
      name.text,
      city.text,
      street.text,
      lat.toString(),
      long.toString(),
    );
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.HomePage);
        Get.snackbar("Successfuly", "Now, your Can order to this address",);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    street.dispose();
    city.dispose();
    super.dispose();
  }
}
