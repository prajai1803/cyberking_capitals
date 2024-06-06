import 'package:chewie/chewie.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/modules/study_module/controller.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ModuleVideoController extends GetxController {
  final _repository = HomeRepository(apiProvider: ApiProvider());
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  final VideoModel video =
      (Get.arguments as Map<String, dynamic>)["videoModel"];
  final List completedSession =
      (Get.arguments as Map<String, dynamic>)["sessionCompletedList"];

  bool markAsDone = false;
  void setMarkDone(value) {
    markAsDone = value;
    update(["Mark Done"]);
  }

  bool markloading = false;
  void setMarkLoading(value) {
    markloading = value;
    update(["Mark Done"]);
  }

  @override
  void onInit() {
    _checkSessionIsComplete();
    _initVideo();
    super.onInit();
  }

  void _checkSessionIsComplete() {
    markAsDone = completedSession.any((e) => e == video.videoId);
    setMarkDone(markAsDone);
  }

  void _initVideo() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(video.videoUrl!));
    await videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: videoPlayerController.value.aspectRatio,
        materialProgressColors: ChewieProgressColors(handleColor: Colors.red));
    update(["ModuleVideo"]);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }

  void play() async {
    await chewieController.play();
  }

  void puase() async {
    await chewieController.pause();
  }

  void updateMark() async {
    try {
      setMarkDone(true);
      setMarkLoading(true);
      final user = await StorageProvider().readUserModel();

      var success = await _repository.submitSession(user.id, video.videoId);

      if (success) {
        if (Get.isRegistered<StudyModuleController>()) {
          Get.put(StudyModuleController()).getModuleRecord();
        }
      }
      setMarkLoading(false);
    } catch (e) {
      setMarkLoading(false);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
