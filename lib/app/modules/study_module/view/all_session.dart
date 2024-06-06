import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/modules/study_module/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/session_tile.dart';

class AllSession extends StatelessWidget {
  AllSession({super.key});

  final _controller = Get.find<StudyModuleController>();

  final List completedSession = Get.arguments as List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Session"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.sessionList.length,
          itemBuilder: (context, index) => SessionTile(
            title: _controller.sessionList[index].sessionName,
            description: _controller.sessionList[index].sessionDesc,
            duration:
                (_controller.sessionList[index].videoDuration ?? 0).toHHMM(),
            thumbnail: _controller.sessionList[index].thumbnail,
            onTap: () {
              Get.toNamed(AppRoute.moduleVideo, arguments: {
                "videoModel": VideoModel(
                    description: _controller.sessionList[index].sessionDesc,
                    title: _controller.sessionList[index].sessionName,
                    duration:
                        "${_controller.sessionList[index].videoDuration} ",
                    session: 2,
                    videoId: _controller.sessionList[index].sessionId,
                    videoUrl: _controller.sessionList[index].videoLink),
                "sessionCompletedList": completedSession
              });
            },
            index: index + 1,
          ),
        ),
      ),
    );
  }
}
