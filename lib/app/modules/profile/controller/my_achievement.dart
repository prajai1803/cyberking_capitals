import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/certificate_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/profile/repository.dart';
import 'package:cyberking_capitals/app/utils/custom_exception.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';

class MyAchievementController extends GetxController {
  List<CertificateModel> certificatesList = List.empty(growable: true);

  final StorageProvider _sessionDB = StorageProvider();
  final ProfileRepository _repository =
      ProfileRepository(apiProvider: ApiProvider());

  ScreenState screenState = ScreenState.loading;
  void setScreenState(ScreenState state) {
    screenState = state;
    update(["Main Screen"]);
  }

  Future<void> fetchAllCertificates() async {
    try {
      setScreenState(ScreenState.loading);
      final UserModel user = await _sessionDB.readUserModel();
      certificatesList = await _repository.getCertificates(user.id);
      setScreenState(ScreenState.loaded);
    } on ApiStatusException catch (e) {
      setScreenState(ScreenState.error);
      CommonAlerts.showErrorSnack(message: e.message);
    } catch (e) {
      setScreenState(ScreenState.error);
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
