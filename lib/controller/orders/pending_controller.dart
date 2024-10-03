import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders/pending.dart';
import 'package:ecommerce_app/data/model/ordersModel.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController {
  late Statusrequest statusrequest;
  PendingordersData pendingordersData = PendingordersData(Get.find());
  List<OrdersModel> data = [];
  MyServices myServices = Get.find();

  getOrders() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await pendingordersData
        .getOrders(
          myServices.sharedPreferences.getString("id").toString()
          );
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

  deleteOrder(String orderid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await pendingordersData.deleteOrders(orderid);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response['status'] == "success") {
        refreshOrder();
      }
    } else {
      statusrequest = Statusrequest.failure;
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
      return "Archive";
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
