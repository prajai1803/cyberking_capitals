import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';

class ProfileRepository {
  final ApiProvider apiProvider;
  ProfileRepository({required this.apiProvider});

  Future<UserModel?> getProfile() async {
    try {
      final res = await apiProvider.getProfile();
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          final userModel =
              UserModel.fromJson(resBody["data"][0] as Map<String, dynamic>);

          return userModel;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<bool> updateProfile(UserModel user) async {
    try {
      final res = await apiProvider.updateProfile(user);
      if (res != null) {
        final resBody = res.body;

        if (resBody["success"] == true) {
          return true;
        } else {
          throw ApiStatusException(message: resBody["message"]);
        }
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }
}
