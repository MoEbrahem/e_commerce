import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);

  postData(email, verifyCode) async {
    var response = await crud.postRequest(
        AppLink.verifycode, {"email": email, "verifycode": verifyCode});
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    await crud.postRequest(
      AppLink.reSend,
      {
        'email': email,
      },
    );
  }
}
