import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/modules/profile/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/logout.dart';
import 'widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _controller.getProfile();
      }),
      backgroundColor: const Color(0xeFF5F6FB),
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(
            color: AppColors.textBlack,
            fontSize: 16.h,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 32.h),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.editProfile,
                  arguments: _controller.userModel);
            },
            child: Container(
              height: 96.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.all(16.r),
                    child: const CircleCachedImage(
                      imageUrl: "dsd",
                      radius: 32,
                    )),
                GetBuilder(
                  init: _controller,
                  id: "Profile",
                  initState: (_) {},
                  builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller.userModel.fullName ?? "",
                          style: TextStyle(
                              fontSize: 16.h, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _controller.userModel.email ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.h,
                              color: AppColors.textBlack3),
                        )
                      ],
                    );
                  },
                ),
              ]),
            ),
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {
              Get.toNamed(AppRoute.membership,
                  arguments: VideoModel(
                      description:
                          "This meta-description generator uses machine learning",
                      title: "Technical Analysis Module",
                      duration: "20 min",
                      session: 2,
                      videoId: "VideoId",
                      videoUrl: "ulr"));
            },
            title: "Membership",
            iconData: Icons.wallet_membership_outlined,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {
              Get.toNamed(AppRoute.myAchievement);
            },
            title: "Certificate",
            iconData: Icons.celebration,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {
              Get.toNamed(AppRoute.refer);
            },
            title: "Invite Friends",
            iconData: Icons.group,
          ),
          SizedBox(height: 16.h),
          ProfileButton(
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const LogoutDialog();
                },
              );
            },
            title: "Logout",
            iconData: Icons.logout,
          ),
        ],
      )),
    );
  }
}
