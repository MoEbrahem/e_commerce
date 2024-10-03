import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String userid) async {
    var response = await crud.postRequest(
      AppLink.viewAddress, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(
    String userid,
    String addressid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(AppLink.editAddress, {
      "addressid": addressid,
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  addData(
    String userid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(
      AppLink.addAddress, {
      "usersid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String addressid,
  ) async {
    var response = await crud.postRequest(AppLink.deleteAddress, {
      "addressid": addressid,
      
    });
    return response.fold((l) => l, (r) => r);
  }
}
