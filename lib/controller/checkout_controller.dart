import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address.dart';
import 'package:ecommerce_app/data/datasource/remote/checkout.dart';
import 'package:ecommerce_app/data/model/addressModel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  Statusrequest statusrequest = Statusrequest.none;
  AddressData addressData = AddressData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> listModelAddress = [];
  late String discountcoupon;

  String? deliveryType;
  String? paymentMethod;
  String addressId = "0";
  late String couponid;
  late String orderprice;

  checkdeliveryType(String val) {
    deliveryType = val;
    update();
  }

  checkPaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  checkShippingAddress(String val) {
    addressId = val;
    update();
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("Error", "Please Select your Payment Method");

    if (deliveryType == null)
      return Get.snackbar("Error", "Please Select your Delivery Type");
    if (listModelAddress.isEmpty)
      return Get.snackbar("Error", "Please Select your Delivery Type");

    statusrequest = Statusrequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressId,
      "pricedelivery": "10",
      "ordersprice": orderprice,
      "couponid": couponid,
      "orderstype": deliveryType,
      "paymentmethod": paymentMethod,
      "discountcoupon": discountcoupon
    };

    var response = await checkOutData.checkOutData(data);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "The Order was Successfully");
        Get.offAllNamed(AppRoute.HomePage);
      } else {
        statusrequest == Statusrequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  getShippingAddress() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        listModelAddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressId = listModelAddress[0].addressId.toString();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    orderprice = Get.arguments['orderprice'];
    discountcoupon = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
