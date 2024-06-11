// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class ArchiveordersData {
  Crud crud;
  ArchiveordersData(this.crud);

  getArchiveOrders(String userid) async {
    var response = await crud.postRequest(
      AppLink.archiveOrder,
      {
        "userid": userid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  rating(String orderid, String rating, String message) async {
    var response = await crud.postRequest(
      AppLink.rating,
      {
        "orderid": orderid,
        "rating": rating,
        "message": message,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
