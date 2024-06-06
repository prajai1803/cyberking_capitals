import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/question_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/quiz/repository.dart';
import 'package:cyberking_capitals/app/modules/study_module/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final QuizRepository _repository = QuizRepository(ApiProvider());
  final _storageProvider = StorageProvider();
  int curentPage = 0;
  late final PageController pageController;
  late List<int?> selectedAnswerList;

  int correctAnserCount = 0;

  bool isLoading = false;

  late List<QuestionModel> quiz;
  late Module module;

  ScreenState screenState = ScreenState.loading;
  void setScreenState(ScreenState value) {
    screenState = value;
    update(["Main Screen"]);
  }

  @override
  void onInit() async {
    module = Get.arguments as Module;
    isLoading = true;
    update();
    fetchQuiz();

    isLoading = false;
    update();
    super.onInit();
  }

  void fetchQuiz() async {
    try {
      setScreenState(ScreenState.loading);
      quiz = await _repository.getQuizByModuleId(module.moduleId!);
      pageController = PageController(initialPage: 0);
      selectedAnswerList = List.generate(quiz.length, (index) => null);
      setScreenState(ScreenState.loaded);
    } catch (e) {
      setScreenState(ScreenState.error);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }

  void selectAnswer(index, v) {
    selectedAnswerList[index] = v;
    update(['Answer']);
  }

  int getCurrentPage() {
    return (pageController.page ?? 0).toInt();
  }

  void nextPage() {
    if (getCurrentPage() == quiz.length) {}
    pageController
        .nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linearToEaseOut)
        .then((value) => update(["Page Number"]));
  }

  void previousPage() {
    pageController
        .previousPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linearToEaseOut)
        .then((value) => update(["Page Number"]));
  }

  void submit() async {
    try {
      final correctAnswerList = quiz.map((e) => e.answer).toList();
      int matchCount = 0;

      for (int i = 0; i < correctAnswerList.length; i++) {
        if (correctAnswerList[i] == selectedAnswerList[i]) {
          matchCount++;
        }
      }
      correctAnserCount = matchCount;
      UserModel user = await _storageProvider.readUserModel();
      await _repository.submitQuiz(user.id, module.moduleId, correctAnserCount);
      Get.find<StudyModuleController>().getModuleRecord();

      Get.toNamed(AppRoute.quizResult);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
