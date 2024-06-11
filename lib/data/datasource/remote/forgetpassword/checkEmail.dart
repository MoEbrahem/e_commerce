import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(email) async {
    var response = await crud.postRequest(
      AppLink.checkEmail, 
      {
      "email"      : email   ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
