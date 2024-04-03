import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:cyberking_capitals/app/modules/home/controller/module_video.dart';
import 'package:cyberking_capitals/app/modules/profile/controller.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AppBaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AppBaseController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ModuleVideoController());
  }
}
