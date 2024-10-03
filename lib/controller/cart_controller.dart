import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cartData.dart';
import 'package:ecommerce_app/data/model/cartModel.dart';
import 'package:ecommerce_app/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CouponModel? couponModel;
  String? couponName;
  String? couponid;
  int Shipping = 20;
  late Statusrequest statusrequest;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  double totalprice = 0.0;
  int totalcount = 0;
  List<CartModel> data = [];
  TextEditingController? couponController;
  int? discountcoupon = 0;

  add(String itemsid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة الملف الى السلة"));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم ازالة الملف من السلة"));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  gotoPageCheckOut() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السلة فارغة");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "orderprice": totalprice.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  getTotalPrice() {
    return totalprice - (totalprice * (discountcoupon! / 100)) + Shipping;
  }

  checkCoupon() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.checkCoupon(couponController!.text);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        couponName = null;
        couponid = null;
        discountcoupon = 0;
        Get.snackbar("Warning", "Your coupon isn't Valid");
      }
    }
    update();
  }

  resetvalue() {
    totalprice = 0.0;
    totalcount = 0;
    data.clear();
  }

  refreshPage() {
    resetvalue();
    view();
  }

  view() async {
    statusrequest = Statusrequest.loading;
    var response =
        await cartData.view(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        if (response['data']['status'] == 'success') {
          List dataresponse = response['data']['data'];
          Map dataCountPrice = response['countprice'];
          data.clear();
          data.addAll(
            dataresponse.map((e) => CartModel.fromJson(e)),
          );
          myServices.sharedPreferences
              .setString("order_userid", data[0].cartUsersid.toString());
          totalprice = double.parse(dataCountPrice['totalprice'].toString());
          totalcount = int.parse(dataCountPrice['totalcount'].toString());
        }
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    view();
    super.onInit();
  }
}
