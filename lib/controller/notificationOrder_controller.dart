import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  late Statusrequest statusrequest;
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();

  List data = [];

  getData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      }
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
