import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:cyberking_capitals/app/modules/profile/controller.dart';
import 'package:cyberking_capitals/app/modules/profile/controller/edit_profile_controller.dart';
import 'package:cyberking_capitals/app/modules/profile/controller/my_achievement.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => MyAchievementController());
    Get.lazyPut(() => HomeController());
  }
}
