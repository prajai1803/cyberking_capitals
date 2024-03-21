import 'package:get/get.dart';

class StudyModuleController extends GetxController {
  bool allSessionOpend = false;
  bool quizOpend = false;
  bool certificateOpend = false;

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
