import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  gotoresetPassword(verificationCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  Statusrequest statusrequest =Statusrequest.none;
  VerifyCodeForgetpasswordData verifyCodeForgetpasswordData = VerifyCodeForgetpasswordData(Get.find());
  
  @override
  gotoresetPassword(verificationCode) async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await verifyCodeForgetpasswordData.postData(email, verificationCode);
    statusrequest = handlingData(response);
    if(statusrequest == Statusrequest.success){
        if (response?['status'] == 'success') {
          Get.offAllNamed(AppRoute.resetPassword, arguments: {
            'email': email
          });
        } else {
          statusrequest = Statusrequest.failure;
          Get.defaultDialog(
              title: 'Warning !!', middleText: "Email OR Password is Wrong ");
        }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
