import 'package:cyberking_capitals/app/data/services/local_notification/flutter_local_notification.dart';
import 'package:cyberking_capitals/app/utils/network_manager.dart';
import 'package:get/get.dart';

class AppInitailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterNotificationService(), permanent: true);
    Get.put(NetworkManagerController(), permanent: true);
  }
}
