import 'package:course_getx/utils/home_binding.dart';
import 'package:course_getx/view/home.dart';
import 'package:course_getx/view/pageOne.dart';
import 'package:course_getx/view/pagethree.dart';
import 'package:course_getx/view/pagetwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/pageone", page: () => Pageone(),),
        GetPage(name: "/pagetwo", page: () => PageTwo()),
        GetPage(name: "/pagethree", page: () => PageThree()),
      ],
      home: HomeScreen(),
    );
  }
}
