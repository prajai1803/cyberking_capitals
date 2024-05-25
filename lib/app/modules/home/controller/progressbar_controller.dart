import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/progressbar_model.dart';
import 'package:cyberking_capitals/app/data/models/user_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/home/repository.dart';
import 'package:get/get.dart';

class ProgressBarController extends GetxController {
  final StorageProvider _storageProvider = StorageProvider();
  final HomeRepository _repository = HomeRepository(apiProvider: ApiProvider());
  late ProgressBarModel? progressBarModel;
  late UserModel user;

  ScreenState screenState = ScreenState.loading;

  void setScreenState(ScreenState value) {
    screenState = value;
    update(["Main Screen"]);
  }

  @override
  void onInit() {
    fetchInitialData();
    super.onInit();
  }

  void fetchInitialData() async {
    try {
      setScreenState(ScreenState.loading);
      user = await _storageProvider.readUserModel();
      progressBarModel = await _repository.getProgressBar(user.id!);

      setScreenState(ScreenState.loaded);
    } catch (e) {
      setScreenState(ScreenState.error);
    }
  }
}
