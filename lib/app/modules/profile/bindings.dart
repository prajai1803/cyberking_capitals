import 'package:cyberking_capitals/app/modules/profile/controller/edit_profile_controller.dart';
import 'package:cyberking_capitals/app/modules/profile/controller/my_achievement.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => MyAchievementController());
  }
}
