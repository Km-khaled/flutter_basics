import 'package:course_getx/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
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
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/pageone");
              },
              child: const Text('Page One'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/pagetwo");
              },
              child: const Text('Page Two'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/pagethree");
              },
              child: const Text('Page Three'),
            ),
            ElevatedButton(
              onPressed: () {
                sharedPref!.clear(); // Only remove the ID used in login
                Get.offAllNamed("/");
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
