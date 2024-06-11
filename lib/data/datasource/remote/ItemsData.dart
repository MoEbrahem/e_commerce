import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String categoryid,String userid) async {
    var response = await crud.postRequest(AppLink.items, {
      "categoryid": categoryid,
      "usersid":userid,

    },);
    return response.fold((l) => l, (r) => r);
  }
}
