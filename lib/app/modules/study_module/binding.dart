import 'package:cyberking_capitals/app/modules/study_module/controller.dart';
import 'package:get/get.dart';

class StudyModuleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(StudyModuleController());
  }
}
