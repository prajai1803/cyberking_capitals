import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/feature_video_model.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
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
  UserModel? user;
  final StorageProvider _storageProvider = StorageProvider();
  late VideoPlayerController introVPC;
  List<FeatureVideoModel> featureVideoList = [];
  List<Module> moduleList = [];
  List<Session> sessionList = [];
  IntroVideos? introVideoModel;
  final TextEditingController searchTextController = TextEditingController();
  List<dynamic> showModulesAndSession = [];

  ScreenState screenState = ScreenState.loading;
  final SpeechToText _speechToText = SpeechToText();

  List<ModuleSessionModel> moduleSessionList = [];

  bool isVoiceRecording = false;

  @override
  void onInit() async {
    user = await _storageProvider.readUserModel();
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() async {
    try {
      screenState = ScreenState.loading;
      update(["Loading Screen"]);

      await getHomeQueries();

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
      screenState = ScreenState.loading;
      update(["Loading Screen"]);
      await getHomeQueries();

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

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Future<void> getHomeQueries() async {
    try {
      final user = await StorageProvider().readUserModel();
      moduleSessionList = await _homeRepository.getHomeQueries(user.id);
      List<Module> modulesTemp = [];
      List<Session> sessionTemp = [];
      for (var element in moduleSessionList) {
        modulesTemp.assignAll(element.modules!);
        for (var i = 0; i < (element.modules?.length ?? 0); i++) {
          for (var session in modulesTemp[i].sessions!) {
            sessionTemp.add(session);
          }
        }
      }
      sessionList.assignAll(sessionTemp);
      moduleList.assignAll(modulesTemp);
      introVideoModel = moduleSessionList.first.introVideos;
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
      showModulesAndSession = [...moduleList, ...sessionList];

      showModulesAndSession = showModulesAndSession.where((element) {
        if (element.runtimeType == Session) {
          element as Session;
          return element.sessionName!
              .toLowerCase()
              .contains(value.toLowerCase());
        } else {
          element as Module;
          return element.moduleName!
              .toLowerCase()
              .contains(value.toLowerCase());
        }
      }).toList();
    }

    update(["HomeSearch"]);
  }
}
