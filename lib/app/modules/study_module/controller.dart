import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/module_record.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/session_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/study_module/repository.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';

class StudyModuleController extends GetxController {
  final StudyRepository _repository =
      StudyRepository(apiProvider: ApiProvider());
  final _storageProvider = StorageProvider();

  bool allSessionOpend = false;
  bool quizOpend = false;
  bool certificateOpend = false;

  late Module studyModuleModel;

  ModuleRecordModel? moduleRecord;

  List<SessionModel> sessionList = List.empty(growable: true);

  ScreenState screenState = ScreenState.loading;
  void setScreenState(ScreenState value) {
    screenState = value;
    update(["Below Screen"]);
  }

  @override
  void onInit() {
    studyModuleModel = Get.arguments as Module;
    getModuleRecord();
    getSesion();
    super.onInit();
  }

  void getSesion() async {
    try {
      update();
      sessionList =
          await _repository.getSessionByModuleId(studyModuleModel.moduleId!);
      update();
    } catch (e) {
      CommonAlerts.showErrorSnack(message: "no sesion found");
      update();
      Get.back();
    }
  }

  void getModuleRecord() async {
    try {
      setScreenState(ScreenState.loading);
      final userModel = await _storageProvider.readUserModel();
      moduleRecord = await _repository.getModuleRecord(
          userModel.id, 28, studyModuleModel.moduleId);
      setScreenState(ScreenState.loaded);
    } catch (e) {
      setScreenState(ScreenState.error);
    }
  }

  void toogleAllSession() {
    allSessionOpend = !allSessionOpend;
    update(["all session"]);
  }

  void toogleQuiz() {
    quizOpend = !quizOpend;
    update(["quiz"]);
  }

  void toogleCertificate() {
    certificateOpend = !certificateOpend;
    update(["certificate"]);
  }
}
