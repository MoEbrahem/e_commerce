import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class VerifyCodeForgetpasswordData {
  Crud crud;
  VerifyCodeForgetpasswordData(this.crud);

  postData(email,verifyCode) async {
    var response = await crud.postRequest(
      AppLink.verifycodeforgetpassword, 
      {
      "email"      : email   ,
      "verifycode" : verifyCode
    });
    return response.fold((l) => l, (r) => r);
  }
}
