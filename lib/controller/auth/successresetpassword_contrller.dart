import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  gotoLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  gotoLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
