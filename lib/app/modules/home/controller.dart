import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late final VideoPlayerController introVPC;

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
    introVPC.play();

    introVPC.addListener(_introVideoListner);
    update(['introVideo']);
  }

  @override
  void dispose() {
    introVPC.removeListener(_introVideoListner);
    super.dispose();
  }

  _introVideoListner() {
    update(['introVideo']);
  }
}
