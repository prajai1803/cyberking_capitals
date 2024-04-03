import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/profile/repository.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _profileRepository = ProfileRepository(apiProvider: ApiProvider());
  final _storageProvider = StorageProvider();

  UserModel userModel = UserModel();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    update(["Profile"]);
    try {
      UserModel user = await _storageProvider.readUserModel();
      if (user.email != null) {
        final res = await _profileRepository.getProfile(user.email ?? "");
        if (res != null) {
          if (res.body['data'] != null) {
            userModel = UserModel.fromJson(res.body["data"]);
            _storageProvider.writeUserModel(userModel);
          } else {
            CommonAlerts.showErrorSnack(message: res.body["msg"]);
          }
        }
      }
    } catch (e) {
      CommonAlerts.showErrorSnack(message: e.toString());
    }
    update(["Profile"]);
  }
}
