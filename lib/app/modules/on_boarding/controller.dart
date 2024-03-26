import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late final PageController pageController;
  int currentPage = 0;

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
    await pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    currentPage = pageController.page!.toInt();
    update();
  }
}
