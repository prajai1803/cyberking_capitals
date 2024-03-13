import 'package:cyberking_capitals/app/data/services/local_notification/flutter_local_notification.dart';
import 'package:get/get.dart';

class AppInitailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterNotificationService(), permanent: true);
  }
}
