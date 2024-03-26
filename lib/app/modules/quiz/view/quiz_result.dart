import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/quiz/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuizResultScreen extends StatelessWidget {
  QuizResultScreen({super.key});

  final _controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 24.h),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Quiz Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.h, left: 24.w, right: 24.w),
              child: Image.asset(AppImages.tropy),
            ),
            SizedBox(height: 12.h),
            Text(
              "Congratulations",
              style: TextStyle(fontFamily: "Playball", fontSize: 32.h),
            ),
            SizedBox(height: 12.h),
            Text(
              "YOUR SCORE",
              style: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12.h),
            Text(
              "${_controller.correctAnserCount}/${_controller.dataList.length}",
              style: TextStyle(
                  fontSize: 32.h,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rakkas"),
            ),
            Text(
              "You did a great job, Learn more by taking\nanother quiz.",
              style: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
