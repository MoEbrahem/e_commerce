import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(username, password, email, phoneNumber) async {
    var response = await crud.postRequest(
      AppLink.signup, {
      "username": username,
      "password": password,
      "email"   : email   ,
      "phone"   : phoneNumber
    });
    return response.fold((l) => l, (r) => r);
  }
}
