import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/modules/store/repository.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final _repository = StoreRepository(apiProvider: ApiProvider());
  List<Module> moduleList = List.empty(growable: true);

  bool mainLoading = true;
  void setMainLoading(value) {
    mainLoading = value;
    update(["Main Screen"]);
  }

  @override
  void onInit() {
    fetchInitData();
    super.onInit();
  }

  void fetchInitData() async {
    try {
      setMainLoading(true);
      moduleList = await _repository.getStore();
      setMainLoading(false);
    } catch (e) {
      setMainLoading(false);
    }
  }
}
