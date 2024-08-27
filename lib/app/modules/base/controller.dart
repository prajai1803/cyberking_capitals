import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBaseController extends GetxController {
  final currentIndex = 0.obs;

  late final TabController tabController;

  void setTabController(TickerProvider vsync, int length) {
    tabController = TabController(length: length, vsync: vsync);
  }

  void chnageTab(int index) {
    tabController.animateTo(index);
    currentIndex.value = index;
  }
}
