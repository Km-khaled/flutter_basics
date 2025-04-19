import 'package:course_getx/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_getx/services/setting_services.dart';

class LocaleController extends GetxController {
  Locale initialLang =
      sharedPref.getString("lang") == null
          ? Locale(Get.deviceLocale.toString())
          : Locale(sharedPref.getString("lang")!);

  void changeLocale(String langCode) {
    Locale locale = Locale(langCode);
    sharedPref.setString("lang", langCode);

    Get.updateLocale(locale);
  }
}
