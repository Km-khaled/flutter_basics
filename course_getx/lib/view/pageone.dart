import 'package:course_getx/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pageone extends StatelessWidget {
  final controller = Get.find<Homecontroller>();

  Pageone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page One')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    controller.increment();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(''),
                ),
                GetBuilder<Homecontroller>(
                  builder: (controller) {
                    return Text(
                      "${controller.counter.value}",
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    controller.decrement();
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text(''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
