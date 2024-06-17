import 'package:chewie/chewie.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/modules/home/controller/module_video.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _ModuleVideoPlayerState();
}

class _ModuleVideoPlayerState extends State<MembershipScreen> {
  final _controller = Get.put(ModuleVideoController());

  final VideoModel video =
      (Get.arguments as Map<String, dynamic>)["videoModel"];
  final List completedSession =
      (Get.arguments as Map<String, dynamic>)["sessionCompletedList"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Membership")),
        body: Column(
          children: [
            SizedBox(height: 32.h),
            GetBuilder(
              init: _controller,
              id: "ModuleVideo",
              initState: (_) {},
              builder: (_) {
                return _controller.videoPlayerController.value.isInitialized
                    ? Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: AspectRatio(
                            aspectRatio: _controller
                                .videoPlayerController.value.aspectRatio,
                            child: Chewie(
                                controller: _controller.chewieController),
                          ),
                        ),
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 189.h,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25.r)),
                        ),
                      );
              },
            ),
            SizedBox(height: 16.h),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How To Get Membership",
                    style:
                        TextStyle(fontSize: 18.h, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text(
                      "This meta-description generator uses a machine learning (GPT-3 from Open AI) to generate short description ideas for your articles.",
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlack2),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  AppElevatedButton(
                    text: "Join membership",
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}
