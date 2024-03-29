import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  int curentPage = 0;
  late final PageController pageController;
  late List<int?> selectedAnswerList;

  int correctAnserCount = 0;

  bool isLoading = false;

  final dataList = [
    {
      "question": "What is not a programming language",
      "options": ["Java", "Python", "Go", "HTML"],
      "answer": 3,
    },
    {
      "question": "What is full form of JWT",
      "options": [
        "Json Web Token",
        "Json World Token",
        "Java Wava Tech",
        "None of above"
      ],
      "answer": 0,
    },
    {
      "question": "What is 10",
      "options": ["Int", "Double", "String", "Bool"],
      "answer": 0,
    },
  ];

  @override
  void onInit() {
    isLoading = true;
    update();
    pageController = PageController(initialPage: 0);
    selectedAnswerList = List.generate(dataList.length, (index) => null);
    isLoading = false;
    update();
    super.onInit();
  }

  void selectAnswer(index, v) {
    selectedAnswerList[index] = v;
    update(['Answer']);
  }

  int getCurrentPage() {
    return (pageController.page ?? 0).toInt();
  }

  void nextPage() {
    if (getCurrentPage() == dataList.length) {}
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

  void submit() {
    final correctAnswerList = dataList.map((e) => e['answer']).toList();
    int matchCount = 0;

    for (int i = 0; i < correctAnswerList.length; i++) {
      if (correctAnswerList[i] == selectedAnswerList[i]) {
        matchCount++;
      }
    }
    correctAnserCount = matchCount;
    Get.toNamed(AppRoute.quizResult);
  }
}
