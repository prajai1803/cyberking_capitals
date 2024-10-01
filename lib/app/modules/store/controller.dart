import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/payment_post_model.dart';
import 'package:cyberking_capitals/app/data/providers/api/api_provider.dart';
import 'package:cyberking_capitals/app/data/providers/storage_provider.dart';
import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:cyberking_capitals/app/modules/store/repository.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final _repository = StoreRepository(apiProvider: ApiProvider());
  final _storageProvider = StorageProvider();
  final _homeController = Get.find<HomeController>();
  List<Module> moduleList = [];

  ScreenState screenState = ScreenState.loading;

  bool mainLoading = true;
  void setMainLoading(value) {
    mainLoading = value;
    update(["Main Screen"]);
  }

  bool buttonLoading = true;
  void setButtonLoading(value) {
    buttonLoading = value;
    update(["Button Loading"]);
  }

  @override
  void onInit() {
    fetchInitData();
    super.onInit();
  }

  void fetchInitData() async {
    try {
      screenState = ScreenState.loading;
      setMainLoading(true);
      moduleList = await _repository.getStore();
      screenState = ScreenState.loaded;
      setMainLoading(false);
    } catch (e) {
      screenState = ScreenState.error;
      setMainLoading(false);
    }
  }

  void claimFreeModule(String? productId) async {
    try {
      setButtonLoading(true);
      CommonAlerts.showLoadingDialog();
      final user = await _storageProvider.readUserModel();
      final paymentDetails = PaymentPostModel(
        studentId: user.id,
        balanceAmount: 0,
        categoryId: 11,
        paidAmount: 0,
        productId: productId,
      );
      final success = await _repository.makePayment(paymentDetails);
      if (success) {
        setButtonLoading(false);
        Get.back();
        CommonAlerts.showSuccessSnack(message: "Successfully claim the module");
        fetchInitData();
        _homeController.fetchInitialData();
      }
    } catch (e) {
      setButtonLoading(false);
      Get.back();
      CommonAlerts.showErrorSnack(message: e.toString());
    }
  }
}
