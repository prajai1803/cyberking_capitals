import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/on_boarding/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoaringScreen extends StatelessWidget {
  OnBoaringScreen({super.key});

  final _controller = Get.find<OnBoardingController>();

  final contentList = [
    Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 450.h,
            ),
            Positioned(
              top: 20.h,
              child: Image.asset(
                AppImages.worldMap,
                width: 328.w,
              ),
            ),
            Positioned(
                top: 164.h,
                child: Image.asset(
                  AppImages.girlStudy,
                  width: 347.w,
                )),
          ],
        ),
        Text(
          "Learn to\ntrade for anytime\nanywhere",
          style: TextStyle(
            fontSize: 32.h,
            color: AppColors.secondary,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
    Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 450.h,
            ),
            Positioned(
              top: 20.h,
              child: Image.asset(
                AppImages.guidence,
                width: 328.w,
              ),
            ),
            Positioned(
                top: 164.h,
                child: Image.asset(
                  AppImages.colleaguesDiscussing,
                  width: 347.w,
                )),
          ],
        ),
        Text(
          "Guided course\nto help you learn\neasily",
          style: TextStyle(
            fontSize: 32.h,
            color: AppColors.secondary,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
    Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 600.h,
            ),
            Positioned(
              top: 20.h,
              child: Image.asset(
                AppImages.target,
                width: 328.w,
              ),
            ),
            Positioned(
                top: 164.h,
                child: Image.asset(
                  AppImages.achievments,
                  width: 347.w,
                  height: 270.h,
                )),
            Positioned(
              top: 430.h,
              child: Text(
                "Set goals\nand track your all\nachievements",
                style: TextStyle(
                  fontSize: 32.h,
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.r,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => contentList[index],
              ),
            ),
            GetBuilder(
              init: _controller,
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contentList.length,
                    (index) => Container(
                      height: 7.h,
                      margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                      width: index == _controller.currentPage ? 27.w : 7.h,
                      decoration: BoxDecoration(
                          color: index == _controller.currentPage
                              ? AppColors.secondary
                              : AppColors.secondary.withOpacity(.5),
                          borderRadius: BorderRadius.circular(90.h)),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: GetBuilder(
                init: _controller,
                initState: (_) {},
                builder: (_) {
                  return AppElevatedButton(
                    text: _controller.currentPage == 2 ? "CONTINUE" : "NEXT",
                    onPressed: () {
                      if (_controller.currentPage == 2) {
                        Get.offAllNamed(AppRoute.appBase);
                      } else {
                        _controller.nextPage();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
