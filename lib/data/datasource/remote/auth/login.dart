import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email,String password) async {
    var response = await crud.postRequest(
      AppLink.login, {
      "email"   : email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
