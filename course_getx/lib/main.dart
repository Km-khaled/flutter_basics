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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MainApp());
}

Future initialService() async {
  await Get.putAsync(() => SettingServices().init());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',

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
