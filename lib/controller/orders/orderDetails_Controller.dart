// ignore_for_file: file_names

import 'dart:async';

import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/ordersDetails_data.dart';
import 'package:ecommerce_app/data/model/ordersDetailModel.dart';
import 'package:ecommerce_app/data/model/ordersModel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  late Completer<GoogleMapController> completerController;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  late Statusrequest statusrequest;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<OrdersDetailsModel> data = [];
  double? lat;
  double? long;

  initialData() {
    if(ordersModel.ordersType =="0") {

      cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 18,
    );
    markers.add(
      Marker(
      markerId: const MarkerId("1"),
      position: LatLng(
        double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!),
        ),
      ),
    );
  }
}

  getData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersDetailsModel.fromJson(e)));
      }
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }
  

  @override
  void onInit() {
    ordersModel = Get.arguments['orderModel'];
    initialData();
    getData();
    super.onInit();
  }
}
