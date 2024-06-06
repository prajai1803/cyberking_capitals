import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late final PageController pageController;
  int currentPage = 0;
  final _session = SessionDB();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int getPageIndex() {
    return pageController.page!.toInt();
  }

  void nextPage() async {
    if (pageController.page == 2) {
      await _session.setOnBoardingComplete(true);
    }
    await pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    currentPage = pageController.page!.toInt();
    update();
  }

  void previousPage() async {
    if (pageController.page == 0) {
      return;
    }
    await pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    currentPage = pageController.page!.toInt();
    update();
  }
}
