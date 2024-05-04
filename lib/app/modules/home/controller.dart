import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/feature_video_model.dart';
import 'package:cyberking_capitals/app/data/models/intro_video_model.dart';
import 'package:cyberking_capitals/app/data/models/module_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:video_player/video_player.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository =
      HomeRepository(apiProvider: ApiProvider());
  late VideoPlayerController introVPC;
  List<FeatureVideoModel> featureVideoList = [];
  List<ModuleModel> studyModuleList = [];
  IntroVideoModel? introVideoModel;
  final TextEditingController searchTextController = TextEditingController();
  List<ModuleModel> showStudyModuleList = [];

  ScreenState screenState = ScreenState.loading;
  final SpeechToText _speechToText = SpeechToText();

  bool isVoiceRecording = false;

  @override
  void onInit() {
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() async {
    try {
      screenState = ScreenState.loading;
      update(["Loading Screen"]);
      await getAllModule();
      await getIntroVideo();
      _initIntroVideo();

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

  void refreshInitialData() async {
    try {
      introVPC.dispose();
      screenState = ScreenState.loading;
      update(["Loading Screen"]);
      await getAllModule();
      await getIntroVideo();
      _initIntroVideo();

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
    print('introVideoModel');
    introVPC = VideoPlayerController.networkUrl(
      Uri.parse(introVideoModel?.link ?? ''),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    await introVPC.initialize();
    await introVPC.play();
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
      final res = await _homeRepository.getAllModule();

      studyModuleList = res;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getIntroVideo() async {
    try {
      introVideoModel = await _homeRepository.getIntroVideo();
    } catch (e) {
      rethrow;
    }
  }

  void speechRec() async {
    // _speechToText = SpeechToText();
    final isEnabled = await _speechToText.initialize(
      onError: (errorNotification) {
        isVoiceRecording = false;
        update(["Mic"]);
      },
    );

    if (isEnabled) {
      isVoiceRecording = true;
      update(["Mic"]);
      try {
        await _speechToText.listen(onResult: _onSpeechResult);
      } catch (e) {
        isVoiceRecording = false;
        update(["Mic"]);
      }
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    try {
      searchTextController.text = result.recognizedWords;
      await Future.delayed(const Duration(seconds: 1));
      isVoiceRecording = false;
      update(["Mic"]);
      searchModule(searchTextController.text);
    } catch (e) {
      isVoiceRecording = false;
      update(["Mic"]);
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
