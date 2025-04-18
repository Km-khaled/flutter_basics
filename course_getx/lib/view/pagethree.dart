import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Three')),
      body: Container(
        alignment: Alignment.center,

        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.offNamed("/pageone");
              },
              child: const Text('Page One'),
            ),

            ElevatedButton(
              onPressed: () {
                Get.offNamed("/pagetwo");
              },
              child: const Text('Page Two'),
            ),
            ElevatedButton(onPressed: () {
              Get.back();
            }, child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}
