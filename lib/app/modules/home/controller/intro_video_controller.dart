import 'package:chewie/chewie.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class IntroVideoController extends GetxController {
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  final SessionDB _sessionDB = SessionDB();

  @override
  void onInit() {
    _initVideo();
    super.onInit();
  }

  void _initVideo() async {
    final IntroVideos video = Get.arguments as IntroVideos;
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(video.videoLink ?? "dsk"));
    await videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: videoPlayerController.value.aspectRatio,
        materialProgressColors: ChewieProgressColors(handleColor: Colors.red));
    update(["Intro Video"]);
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
    _sessionDB.setIntroVideoComplete(true);
  }

  void puase() async {
    await chewieController.pause();
  }
}
