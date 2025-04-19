import 'package:course_getx/main.dart';
import 'package:course_getx/services/setting_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<SettingServices> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build home screen");
    return Scaffold(
      appBar: AppBar(title: const Text('Home ')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SettingServices>(
              builder: (c) => Center(child: Text("${c.counter}")),
            ),
            ElevatedButton(
              onPressed: () {
                controller.increase();
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.sharedPref.clear();
              },
              child: const Text('Clear Counter'),
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
