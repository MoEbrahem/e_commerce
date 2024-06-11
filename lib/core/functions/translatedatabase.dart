import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
translateDatabase(columnAr, columnEn) {
  if (myServices.sharedPreferences.getString("Lang") == 'ar') {
    return columnAr;
  } else {
    return columnEn;
  }
}
