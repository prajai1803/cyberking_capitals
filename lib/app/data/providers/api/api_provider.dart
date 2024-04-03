import 'package:cyberking_capitals/app/data/providers/api/api_routes.dart';
import 'package:cyberking_capitals/app/data/services/api/api_service.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:get/get.dart';

class ApiProvider {
  final ApiService _apiService = ApiService();

  Future<Response> getModules() async {
    return _apiService.get(url: ApiRoutes.getModules);
  }

  Future<Response?> getFeatureVideoList() async {
    try {
      final res = await _apiService.get(url: ApiRoutes.featureVideoList);
      if (res.statusCode == 200) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getModuleByRankList(int batch) async {
    try {
      final res = await _apiService.get(url: "${ApiRoutes.getModules}/$batch");
      if (res.statusCode == 200) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Response?> getProfile(String email) async {
    try {
      final res = await _apiService
          .get(url: ApiRoutes.getProfile, header: {"email": email});
      if (res.statusCode == 200) {
        return res;
      } else {
        _checkException(res);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  void _checkException(Response<dynamic> res) {
    if (res.statusCode == 404) {
      throw ApiStatusException(message: "Url Not Found");
    } else if (res.statusCode == 401) {
      throw ApiStatusException(message: "Not Authorized");
    } else if (res.statusCode == 500) {
      throw ApiStatusException(message: "Server Error");
    } else {
      throw ApiStatusException();
    }
  }
}
