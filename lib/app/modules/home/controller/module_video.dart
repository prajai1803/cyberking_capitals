import 'package:chewie/chewie.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ModuleVideoController extends GetxController {
  final _repository = HomeRepository(apiProvider: ApiProvider());
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  final VideoModel video = Get.arguments as VideoModel;

  bool markAsDone = false;
  void setMarkDone(value) {
    markAsDone = value;
    update(["Mark Done"]);
  }

  @override
  void onInit() {
    _initVideo();
    super.onInit();
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

      final user = await StorageProvider().readUserModel();

      _repository.submitSession(user.id, video.videoId);
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
