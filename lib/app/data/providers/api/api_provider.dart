import 'package:cyberking_capitals/app/data/providers/api/api_routes.dart';
import 'package:cyberking_capitals/app/data/services/api/api_service.dart';
import 'package:get/get.dart';

class ApiProvider {
  final ApiService _apiService = ApiService();

  Future<Response> getModules() async {
    return _apiService.get(url: ApiRoutes.getModules);
  }
}
