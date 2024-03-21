import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/session_tile.dart';

class AllSession extends StatelessWidget {
  const AllSession({super.key});

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
          itemCount: 10,
          itemBuilder: (context, index) => SessionTile(
            title: "Technical Analysis Module",
            description:
                "This meta-description generator uses machine learning.",
            duration: "20 min",
            onTap: () {
              Get.toNamed(AppRoute.moduleVideo,
                  arguments: VideoModel(
                      description:
                          "This meta-description generator uses machine learning",
                      title: "Technical Analysis Module",
                      duration: "20 min",
                      session: 2,
                      videoId: "VideoId",
                      videoUrl: "ulr"));
            },
            index: index + 1,
          ),
        ),
      ),
    );
  }
}
