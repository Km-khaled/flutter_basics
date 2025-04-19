import 'package:course_getx/locale/locale_controller.dart';
import 'package:course_getx/main.dart';
import 'package:course_getx/services/setting_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<SettingServices> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController lngController = Get.find<LocaleController>();
    return Scaffold(
      appBar: AppBar(title: Text("1".tr)),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                lngController.changeLocale("ar");
              },
              child: Text("2".tr),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                lngController.changeLocale("en");
              },
              child: Text("3".tr),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed("/pageone");
            //   },
            //   child: const Text('Page One'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed("/pagetwo");
            //   },
            //   child: const Text('Page Two'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed("/pagethree");
            //   },
            //   child: const Text('Page Three'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     sharedPref!.clear(); // Only remove the ID used in login
            //     Get.offAllNamed("/");
            //   },
            //   child: const Text('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
