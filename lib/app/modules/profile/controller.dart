import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/profile/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserModel? currentUser;

  final StorageProvider _sessionDB = StorageProvider();
  final ProfileRepository _repository =
      ProfileRepository(apiProvider: ApiProvider());

  @override
  void onInit() async {
    currentUser = await _sessionDB.readUserModel();

    if (currentUser == null) {
      _fetchUserProfile();
    } else {
      update(["Profile Details"]);
    }
    super.onInit();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final UserModel? user = await _repository.getProfile();
      if (user != null) {
        currentUser = user;
      }
    } on ApiStatusException catch (e) {
      CommonAlerts.showSuccessSnack(message: e.message);
    } catch (e) {
      CommonAlerts.showSuccessSnack();
    }
  }
}
