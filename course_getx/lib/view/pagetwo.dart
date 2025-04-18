import 'package:course_getx/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwo extends StatelessWidget {
  PageTwo({super.key});
  final controller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Two')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Homecontroller>(
              builder: (controller) {
                return Text(
                  "${controller.counter.value}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
