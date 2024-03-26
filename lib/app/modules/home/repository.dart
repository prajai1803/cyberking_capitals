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
}
