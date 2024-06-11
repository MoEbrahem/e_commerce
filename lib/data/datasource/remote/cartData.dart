// ignore_for_file: file_names
import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class CartData {
  Crud crud;
  CartData(
    this.crud,
  );

  addCart(String userid, String itemsid) async {
    var response = await crud
        .postRequest(AppLink.addCart, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemsid) async {
    var response = await crud.postRequest(
        AppLink.deleteCart, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String userid, String itemsid) async {
    var response = await crud.postRequest(
        AppLink.getCountCart, {"userid": userid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  view(String userid) async {
    var response = await crud.postRequest(AppLink.viewCart, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response =
        await crud.postRequest(AppLink.checkcoupon, {"couponName": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
