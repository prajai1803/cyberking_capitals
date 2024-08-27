import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/feature_model.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/payment_post_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/modules/store/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository =
      HomeRepository(apiProvider: ApiProvider());
  final _storeRepository = StoreRepository(apiProvider: ApiProvider());

  UserModel? user;
  final StorageProvider _storageProvider = StorageProvider();
  late VideoPlayerController introVPC;
  List<FeatureModel> featureList = [];
  List<Module> moduleList = [];
  List<Module> payableModuleList = [];
  List<Session> sessionList = [];
  int completionsHr = 0;
  IntroVideos? introVideoModel;
  final TextEditingController searchTextController = TextEditingController();
  List<dynamic> showModulesAndSession = [];

  ScreenState screenState = ScreenState.loading;
  final SpeechToText _speechToText = SpeechToText();

  List<ModuleSessionModel> moduleSessionList = [];
  bool isBatchAssigned = true;
  bool isVoiceRecording = false;

  @override
  void onInit() async {
    user = await _storageProvider.readUserModel();
    update(["Profile Image"]);
    fetchInitialData();
    super.onInit();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void refreshProfileImage() async {
    user = await _storageProvider.readUserModel();
    update(["Profile Image"]);
  }

  Future<void> fetchStore() async {
    try {
      payableModuleList = await _storeRepository.getStore();

      payableModuleList.removeWhere((payableModule) => moduleList
          .any((module) => module.moduleId == payableModule.moduleId));
    } catch (_) {}
  }

  void fetchInitialData() async {
    try {
      screenState = ScreenState.loading;
      update(["Loading Screen"]);
      await getHomeQueries();
      await fetchStore();
      screenState = ScreenState.loaded;
      update(["Loading Screen"]);
    } on ApiStatusException catch (e) {
      if (e.message == "No-Batch") {
        isBatchAssigned = false;
        screenState = ScreenState.loaded;
        update(["Loading Screen"]);
        return;
      }
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
      await fetchStore();
      screenState = ScreenState.loaded;
      update(["Loading Screen"]);
    } on ApiStatusException catch (e) {
      if (e.message == "No-Batch") {
        isBatchAssigned = false;
        screenState = ScreenState.loaded;
        update(["Loading Screen"]);
        return;
      }
      screenState = ScreenState.error;
      update(["Loading Screen"]);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
      screenState = ScreenState.error;
      update(["Loading Screen"]);
    }
  }

  Future<void> getHomeQueries() async {
    try {
      final user = await StorageProvider().readUserModel();
      moduleSessionList = await _homeRepository.getHomeQueries(user.id);
      List<Module> modulesTemp = [];
      List<Session> sessionTemp = [];
      List<FeatureModel> featureTemp = [];
      int durationTemp = 0;

      // module and session from multiple batches
      for (var element in moduleSessionList) {
        modulesTemp.addAll(element.modules!);
        durationTemp += (element.duration ?? 0);
        if (element.modules != null) {
          List<Module> modules = element.modules as List<Module>;
          for (var module in modules) {
            sessionTemp.addAll(module.sessions ?? []);
          }
        }
      }

      // feature from multiple batches
      for (var element in moduleSessionList) {
        featureTemp.addAll(element.features ?? []);
      }

      completionsHr = durationTemp;
      featureList.assignAll(featureTemp);
      sessionList.assignAll(sessionTemp);
      moduleList.assignAll(modulesTemp);
      introVideoModel = moduleSessionList.first.introVideos;
    } catch (e) {
      rethrow;
    }
  }

  void claimFreeModule(String? productId) async {
    try {
      CommonAlerts.showLoadingDialog();
      final user = await _storageProvider.readUserModel();
      final paymentDetails = PaymentPostModel(
        studentId: user.id,
        balanceAmount: 0,
        categoryId: 11,
        paidAmount: 0,
        productId: productId,
      );
      final success = await _storeRepository.makePayment(paymentDetails);
      if (success) {
        Get.back();
        CommonAlerts.showSuccessSnack(message: "Successfully claim the module");

        fetchInitialData();
      }
    } catch (e) {
      Get.back();
      CommonAlerts.showErrorSnack(message: e.toString());
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

  void openInWeb(String? webUrl) async {
    try {
      final url = Uri.parse(webUrl ?? "");
      if (!(url.isAbsolute)) {
        throw ApiStatusException(message: 'URL is not valid');
      }

      if (!await launchUrl(url)) {
        throw ApiStatusException(message: 'Could not luanch');
      }
    } on ApiStatusException catch (e) {
      CommonAlerts.showErrorSnack(message: e.message);
    } on PlatformException catch (e) {
      CommonAlerts.showErrorSnack(message: e.code);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
