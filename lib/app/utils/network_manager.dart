import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManagerController extends GetxController {
  int connectionType = 0;
  final _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(_updatState);
    super.onInit();
  }

  void getConnection() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } catch (e) {
      printInfo(info: e.toString());
    }
    if (connectivityResult != null) {
      _updatState(connectivityResult);
    }
  }

  _updatState(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        connectionType = 2;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = 1;
        update();
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        break;
      default:
        Get.snackbar("Failed", "stat");
    }
  }
}
