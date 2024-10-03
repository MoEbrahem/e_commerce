import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addData(String userid ,String itemsid) async {
    var response = await crud.postRequest(
      AppLink.addFavorite, {
      "usersid": userid,
      "itemsid":itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
  removeData(String userid ,String itemsid) async {
    var response = await crud.postRequest(
      AppLink.removeFavorite, {
      "usersid" : userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
