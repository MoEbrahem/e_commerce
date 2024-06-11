// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class PendingordersData {
  Crud crud;
  PendingordersData(this.crud);

  getOrders(String userid) async {
    var response = await crud.postRequest(
      AppLink.pendingOrders,
      {
        "userid": userid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
  deleteOrders(String orderid)async{
    var response = await crud.postRequest(
      AppLink.deleteOrder,
      {
        "orderid": orderid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
