import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late final VideoPlayerController introVPC;
  final TextEditingController searchTextController = TextEditingController();

  List<VideoModel> videos = [
    VideoModel(
      videoId: "fd",
      title: "Technical Analysis Module",
      description:
          "This meta-description generator uses a machine learning to generate short description ideas for your articles.",
      duration: "7 hr 30 min",
      session: 8,
      videoUrl: "fsfdsfsd",
    ),
    VideoModel(
      videoId: "fd",
      title: "Java",
      description:
          "This meta-description generator uses a machine learning to generate short description ideas for your articles.",
      duration: "2 hr 12 min",
      session: 2,
      videoUrl: "fsfdsfsd",
    ),
    VideoModel(
      videoId: "fd",
      title: "Cyber",
      description:
          "This meta-description generator uses a machine learning to generate short description ideas for your articles.",
      duration: "5 hr 30 min",
      session: 8,
      videoUrl: "fsfdsfsd",
    )
  ];

  List<VideoModel> showVideos = [];

  @override
  void onInit() {
    _initIntroVideo();
    super.onInit();
  }

  void _initIntroVideo() async {
    introVPC = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
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

  void searchModule(String? value) {
    searchTextController.text.trim();
    if (value != null) {
      showVideos = videos;
      showVideos = videos
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update(["HomeSearch"]);
  }

  _introVideoListner() {
    update(['introVideo']);
  }
}
