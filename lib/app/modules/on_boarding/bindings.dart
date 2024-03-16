import 'package:cyberking_capitals/app/modules/on_boarding/controller.dart';
import 'package:get/get.dart';

class OnBoardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
