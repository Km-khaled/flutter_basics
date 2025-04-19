import 'package:course_getx/controller/theme_controller.dart';
import 'package:course_getx/locale/locale_controller.dart';
import 'package:course_getx/services/setting_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<SettingServices> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController lngController = Get.find<LocaleController>();
    ThemeController themeController = Get.find<ThemeController>();
    
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
            
            // Theme switching buttons
            SizedBox(height: 20),
            Text(
              'Theme Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
            // Current theme indicator
            Obx(() => Text(
              'Current Theme: ${themeController.themeMode.value == ThemeMode.light ? "Light" : "Dark"}',
              style: TextStyle(fontSize: 16),
            )),
            SizedBox(height: 10),
            
            // Light Theme Button
            ElevatedButton(
              onPressed: () {
                if (themeController.themeMode.value != ThemeMode.light) {
                  themeController.switchTheme();
                }
              },
              child: const Text('Switch to Light Theme'),
            ),
            
            SizedBox(height: 10),
            
            // Dark Theme Button
            ElevatedButton(
              onPressed: () {
                if (themeController.themeMode.value != ThemeMode.dark) {
                  themeController.switchTheme();
                }
              },
              child: const Text('Switch to Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
