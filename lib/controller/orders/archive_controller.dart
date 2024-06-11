import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/archiveData.dart';
import 'package:ecommerce_app/data/model/ordersModel.dart';
import 'package:get/get.dart';

class ArchiveOrdersController extends GetxController {
  late Statusrequest statusrequest;
  ArchiveordersData archiveordersData = ArchiveordersData(Get.find());
  List<OrdersModel> data = [];
  MyServices myServices = Get.find();

  getOrders() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = archiveordersData
        .getArchiveOrders(myServices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  submitRating(String orderid, String message, String rating) async{
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await archiveordersData.rating(
      orderid,
      rating,
      message,
    );
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
  }

  refreshOrder() {
    getOrders();
  }

  printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recieve inStore";
    }
  }

  printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is Being Prepared";
    } else if (val == "2") {
      return "Delivery recieve Your order";
    } else if (val == "3") {
      return "Order is On the Way";
    } else {
      return "Order Archived";
    }
  }

  printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
