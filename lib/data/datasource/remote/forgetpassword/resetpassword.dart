import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(email,password) async {
    var response = await crud.postRequest(
      AppLink.resetpassword, 
      {
      "email"      : email,
      "password" : password
    });
    return response.fold((l) => l, (r) => r);
  }
}
