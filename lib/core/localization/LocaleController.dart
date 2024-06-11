import 'package:ecommerce_app/core/constants/apptheme.dart';
import 'package:ecommerce_app/core/functions/fcmconfig.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocaleController extends GetxController {
  int? onSelected;

  Locale? language;

  ThemeData appTheme = EnglishTheme;

  MyServices myServices = Get.find();

  onchangelang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("Lang", langCode);
    appTheme = langCode == 'ar' ? ArabicTheme : EnglishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  onpressLang(index) {
    onSelected = index;
    update();
  }

  onrequestPer() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء الصلاحية الموقع للتطبيق");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("تنبيه", "لا يمكن استخدان التطبيق بدون تحديد الموقع");
    }
  }

  @override
  void onInit() {
    onrequestPer();
    requestPermissionNotification();
    fcmconfig();
    String? SharedPrefLang = myServices.sharedPreferences.getString("Lang");

    if (SharedPrefLang == 'en') {
      appTheme = EnglishTheme;
      language = const Locale("en");
    } else if (SharedPrefLang == 'ar') {
      appTheme = ArabicTheme;
      language = const Locale("ar");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = EnglishTheme;
    }
    super.onInit();
  }
}
