// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String ordersid) async {
    var response = await crud.postRequest(
      AppLink.ordersDetails,
      {
        "orderid": ordersid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
