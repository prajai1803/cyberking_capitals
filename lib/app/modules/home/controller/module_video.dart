import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ModuleVideoController extends GetxController {
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  @override
  void onInit() {
    _initVideo();
    super.onInit();
  }

  void _initVideo() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
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
}
