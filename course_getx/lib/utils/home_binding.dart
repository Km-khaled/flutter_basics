import 'package:course_getx/controller/homecontroller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(Homecontroller(),permanent: true); if  you work with it remember of remove initial binding from main and don't get data from api or db on init
    Get.lazyPut(() => Homecontroller(),fenix: true);
  }
}
