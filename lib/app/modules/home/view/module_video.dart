import 'package:chewie/chewie.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/modules/home/controller/module_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ModuleVideoPlayer extends StatefulWidget {
  const ModuleVideoPlayer({super.key});

  @override
  State<ModuleVideoPlayer> createState() => _ModuleVideoPlayerState();
}

class _ModuleVideoPlayerState extends State<ModuleVideoPlayer> {
  final _controller = Get.put(ModuleVideoController());

  final VideoModel video =
      (Get.arguments as Map<String, dynamic>)["videoModel"];

  @override
  void dispose() {
    Get.delete<ModuleVideoController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Video")),
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
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title ?? "",
                    // "",
                    style:
                        TextStyle(fontSize: 18.h, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    video.description ?? "",
                    // "",
                    style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBlack2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder(
                init: _controller,
                id: "Mark Done",
                initState: (_) {},
                builder: (_) {
                  return Row(
                    children: [
                      const Text(
                        "Mark as done",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        value: _controller.markAsDone,
                        onChanged: (value) {
                          if (!_controller.markAsDone) {
                            _controller.updateMark();
                          }
                        },
                      ),
                      _controller.markloading == true
                          ? const CircularProgressIndicator()
                          : Container(),
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }
}
