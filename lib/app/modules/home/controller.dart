import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/feature_video_model.dart';
import 'package:cyberking_capitals/app/data/models/study_module_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository =
      HomeRepository(apiProvider: ApiProvider());
  late final VideoPlayerController introVPC;
  List<FeatureVideoModel> featureVideoList = [];
  List<StudyModuleModel> studyModuleList = [];
  final TextEditingController searchTextController = TextEditingController();
  List<StudyModuleModel> showStudyModuleList = [];

  ScreenState screenState = ScreenState.loading;

  @override
  void onInit() {
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() async {
    try {
      screenState = ScreenState.loading;
      update(["Loading Screen"]);
      _initIntroVideo();
      await getAllModule();

      screenState = ScreenState.loaded;
      update(["Loading Screen"]);
    } on ApiStatusException catch (_) {
      screenState = ScreenState.error;
      update(["Loading Screen"]);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
      screenState = ScreenState.error;
      update(["Loading Screen"]);
    }
  }

  void _initIntroVideo() async {
    introVPC = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/csvtu-test.appspot.com/o/untitled.mp4?alt=media&token=b7247a40-f377-46a1-8375-2d6d39d6accf'),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await introVPC.initialize();
    introVPC.addListener(_introVideoListner);
    update(['introVideo']);
  }

  @override
  void dispose() {
    introVPC.removeListener(_introVideoListner);
    searchTextController.dispose();
    super.dispose();
  }

  Future<void> getFeatureVideo() async {
    try {
      final Response? res = await _homeRepository.getFeatureVideoList();
      List<FeatureVideoModel> tempList = [];
      if (res != null) {
        if (res.statusCode == 200) {
          final decode = res.body as List;
          for (var element in decode) {
            tempList.add(FeatureVideoModel.fromJson(element));
          }
          featureVideoList = tempList;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllModule() async {
    try {
      final Response? res = await _homeRepository.getModuleByRankList(2);

      List<StudyModuleModel> tempList = [];

      if (res != null) {
        if (res.statusCode == 200) {
          final decode = res.body["DATA"] as List;
          for (var element in decode) {
            tempList.add(StudyModuleModel.fromJson(element));
          }
          studyModuleList = tempList;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void searchModule(String? value) {
    searchTextController.text.trim();
    if (value != null) {
      showStudyModuleList = studyModuleList;
      showStudyModuleList = showStudyModuleList
          .where((element) =>
              element.moduleName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update(["HomeSearch"]);
  }

  _introVideoListner() {
    update(['introVideo']);
  }
}
