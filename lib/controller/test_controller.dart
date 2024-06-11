import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late Statusrequest statusRequest;

  getData() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await testData.getData();
    print(response);
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response?['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        return Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }
}
