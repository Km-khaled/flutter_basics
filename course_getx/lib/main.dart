import 'package:course_getx/locale/locale.dart';
import 'package:course_getx/locale/locale_controller.dart';
import 'package:course_getx/middleware/auth_middleware.dart';
import 'package:course_getx/middleware/super_middleware.dart';
import 'package:course_getx/services/setting_services.dart';
import 'package:course_getx/utils/home_binding.dart';
import 'package:course_getx/view/admin.dart';
import 'package:course_getx/view/home.dart';
import 'package:course_getx/view/login.dart';
import 'package:course_getx/view/pageOne.dart';
import 'package:course_getx/view/pagethree.dart';
import 'package:course_getx/view/pagetwo.dart';
import 'package:course_getx/view/super.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();

  runApp(const MainApp());
}

// Future initialService() async {
//   await Get.putAsync(() => SettingServices().init());
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      initialRoute: '/',
      locale: controller.initialLang,
      translations: MyLocale(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        // GetPage(name: "/home", page: () => HomeScreen()),
        // GetPage(name: "/pageone", page: () => Pageone()),
        // GetPage(name: "/pagetwo", page: () => PageTwo()),
        // GetPage(name: "/pagethree", page: () => PageThree()),
        // GetPage(name: "/admin", page: () => Admin()),
        // GetPage(name: "/super", page: () => Super()),
      ],
    );
  }
}
