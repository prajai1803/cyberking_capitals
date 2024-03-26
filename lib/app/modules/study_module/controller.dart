import 'package:cyberking_capitals/app/data/models/study_module_model.dart';
import 'package:get/get.dart';

class StudyModuleController extends GetxController {
  bool allSessionOpend = false;
  bool quizOpend = false;
  bool certificateOpend = false;

  late StudyModuleModel studyModuleModel;

  @override
  void onInit() {
    studyModuleModel = Get.arguments as StudyModuleModel;
    super.onInit();
  }

  void toogleAllSession() {
    allSessionOpend = !allSessionOpend;
    update(["all session"]);
  }

  void toogleQuiz() {
    quizOpend = !quizOpend;
    update(["quiz"]);
  }

  void toogleCertificate() {
    certificateOpend = !certificateOpend;
    update(["certificate"]);
  }
}
