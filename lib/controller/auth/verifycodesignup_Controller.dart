import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdataController.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignupController extends GetxController {
  gotoSuccessSignup(String verificationCode);
  reSend();
}

class VerifyCodeSignupControllerImp extends VerifyCodeSignupController {
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  late String email;

  @override
  gotoSuccessSignup(verificationCode) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifyCodeSignupData.postData(email, verificationCode);
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response?['status'] == 'success') {
        Get.offNamed(AppRoute.successSignup);
      } else {
        statusrequest = Statusrequest.failure;
        Get.defaultDialog(
            title: 'Warning !!', middleText: "Verification code Not Correct ");
      }
    }
    update();
    Get.offAllNamed(AppRoute.successSignup);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  reSend() {
    verifyCodeSignupData.reSendData(email);
  }
}
