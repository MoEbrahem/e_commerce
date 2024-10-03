// ignore_for_file: file_names

import 'package:ecommerce_app/controller/homepage_controller.dart';
import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/ItemsData.dart';
import 'package:get/get.dart';
// import 'package:ecommerce_app/data/model/itemsModel.dart';

// abstract class ItemsController extends GetxController {
//   initialData();
//   onCatChanged(int val, String catval);
//   getItems(String categoryid);
//   gotopageproductDetails(itemsModel ItemsModel);
// }

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String deliverytime = '';
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  List data = [];
  String? catid;
  late Statusrequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['catid'];
    
    getItems(catid!);
  }

  onCatChanged(val, catval) {
    selectedCat = val;
    getItems(catval);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = Statusrequest.loading;
    update();

    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print(response);
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response?['status'] == 'success') {
        data.addAll(response['data']);
      }
      if (response?['status'] == 'failure') {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  gotopageproductDetails(ItemsModel) {
    Get.toNamed(
      AppRoute.productDetails,
       arguments: {
      'itemsModel': ItemsModel,
    });
  }
}
