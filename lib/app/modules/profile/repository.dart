import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:get/get.dart';

class ProfileRepository {
  final ApiProvider apiProvider;
  ProfileRepository({required this.apiProvider});

  Future<Response?> getProfile(String email) {
    return apiProvider.getProfile(email);
  }
}
