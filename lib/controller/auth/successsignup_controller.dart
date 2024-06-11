import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignupController extends GetxController {
  gotoLogin();
}

class SuccessSignupControllerImp extends SuccessSignupController {
  @override
  gotoLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
