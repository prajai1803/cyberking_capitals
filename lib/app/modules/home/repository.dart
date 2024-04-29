import 'package:cyberking_capitals/app/data/models/intro_video_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:get/get.dart';

class HomeRepository {
  final ApiProvider apiProvider;
  HomeRepository({required this.apiProvider});

  Future<Response?> getFeatureVideoList() async {
    return apiProvider.getFeatureVideoList();
  }

  Future<Response?> getModuleByRankList(int batch) async {
    return apiProvider.getModuleByRankList(batch);
  }

  Future<IntroVideoModel?> getIntroVideo() async {
    try {
      final res = await apiProvider.getIntroVideo();
      if (res != null) {
        List<IntroVideoModel> introVideoList = [];
        List videoDetails = res.body["videoDetails"];
        List<IntroVideoModel> videoDetailsList =
            videoDetails.map((e) => IntroVideoModel.fromJson(e)).toList();
        introVideoList = videoDetailsList
            .where((element) => element.isPublished == 1)
            .toList();
        if (introVideoList.isEmpty) {
          return null;
        }
        return introVideoList.last;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
