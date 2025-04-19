import 'package:course_getx/locale/locale.dart';
import 'package:course_getx/locale/locale_controller.dart';
import 'package:course_getx/middleware/auth_middleware.dart';
import 'package:course_getx/middleware/super_middleware.dart';
import 'package:course_getx/services/setting_services.dart';
import 'package:course_getx/utils/home_binding.dart';
import 'package:course_getx/utils/themes.dart';
import 'package:course_getx/view/admin.dart';
import 'package:course_getx/view/home.dart';
import 'package:course_getx/view/login.dart';
import 'package:course_getx/view/pageOne.dart';
import 'package:course_getx/view/pagethree.dart';
import 'package:course_getx/view/pagetwo.dart';
import 'package:course_getx/view/super.dart';
import 'package:course_getx/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  
  // Register SharedPreferences with GetX first
  Get.put<SharedPreferences>(sharedPref!);
  
  // Then initialize ThemeController which depends on SharedPreferences
  Get.put(ThemeController());
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    final ThemeController themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      themeMode: themeController.themeMode.value,
      theme: Themes.customLightTheme,
      darkTheme: Themes.customDarkTheme,
      initialRoute: '/',
      locale: localeController.initialLang,
      translations: MyLocale(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => HomeScreen(),
          // middlewares: [AuthMiddleware(), SuperMiddleware()],
        ),
        GetPage(name: "/home", page: () => HomeScreen()),
        GetPage(name: "/pageone", page: () => Pageone()),
        GetPage(name: "/pagetwo", page: () => PageTwo()),
        GetPage(name: "/pagethree", page: () => PageThree()),
        // GetPage(name: "/admin", page: () => Admin()),
        GetPage(name: "/super", page: () => Super()),
      ],
    );
  }
}
