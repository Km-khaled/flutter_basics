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

  @override
  void onInit() {
    super.onInit();
    print("fetch data example");
  }

  @override
  void onReady() {
    super.onReady();
    print("HomeController Ready");
  }

  @override
  void onClose() {
    super.onClose();
    print("HomeController Closed");
  }
}
