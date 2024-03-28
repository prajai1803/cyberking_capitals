import 'package:cyberking_capitals/app/modules/refer/controller.dart';
import 'package:get/get.dart';

class ReferBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReferController());
  }
}
