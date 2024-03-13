import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controller.dart';

class IntroVideo extends StatelessWidget {
  IntroVideo({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: _controller,
        id: "introVideo",
        builder: (controller) => _controller.introVPC.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (_controller.introVPC.value.isPlaying) {
                        _controller.introVPC.pause();
                      } else {
                        _controller.introVPC.play();
                      }
                    },
                    child: Container(
                      height: 189.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: AspectRatio(
                          aspectRatio: _controller.introVPC.value.aspectRatio,
                          child: VideoPlayer(_controller.introVPC),
                        ),
                      ),
                    ),
                  ),
                  _controller.introVPC.value.isCompleted
                      ? Center(
                          child: InkWell(
                          onTap: () => _controller.introVPC.play(),
                          child: Container(
                              height: 52.h,
                              width: 52.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(.25))
                                  ]),
                              child: Icon(Icons.play_arrow)),
                        ))
                      : Container()
                ],
              )
            : Container());
  }
}
