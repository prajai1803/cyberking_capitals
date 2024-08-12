import 'package:get/get.dart';
import 'controller.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController());
  }
}
