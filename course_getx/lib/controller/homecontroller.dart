import 'package:get/get.dart';

class Homecontroller extends GetxController {
  RxInt counter = 0.obs;
  void increment() {
    counter++;
    update();
  }

  void decrement() {
    counter--;
    update();
  }
}
