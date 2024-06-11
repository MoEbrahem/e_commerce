import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address.dart';
import 'package:ecommerce_app/data/model/addressModel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();

  late Statusrequest statusrequest;

  getAddress() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressid) async {
    await addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
