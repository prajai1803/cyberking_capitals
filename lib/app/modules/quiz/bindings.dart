import 'package:cyberking_capitals/app/modules/quiz/controller.dart';
import 'package:get/get.dart';

class QuizBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
