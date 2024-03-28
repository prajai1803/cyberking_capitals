import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/icons.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/refer/controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReferScreen extends StatelessWidget {
  ReferScreen({super.key});

  final _controler = Get.find<ReferController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.h,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(height: 600.h),
            Positioned(
              top: 288.h,
              left: 10.w,
              child: Image.asset(
                AppImages.rupee,
                height: 30.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 188.h,
              left: 67.w,
              child: Image.asset(
                AppImages.rupee,
                height: 45.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 265.h,
              left: 85.w,
              child: Image.asset(
                AppImages.rupee,
                height: 45.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 95.h,
              left: 195.w,
              child: Image.asset(
                AppImages.rupee,
                height: 65.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 173.h,
              left: 213.w,
              child: Image.asset(
                AppImages.rupee,
                height: 34.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 300.h,
              left: 300.w,
              child: Image.asset(
                AppImages.rupee,
                height: 34.h,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 173.h,
              left: 260.w,
              child: Image.asset(
                AppImages.rupee,
                height: 34.h,
                color: Colors.black,
              ),
            ),
            Container(
              height: 800.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.pink[400],
                  backgroundBlendMode: BlendMode.overlay),
            ),
            Container(
              height: 547.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.darken,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r)),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.referBG1,
                      AppColors.referBG2,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              child: Column(
                children: [
                  SizedBox(height: 104.h),
                  _buildReferYourFriends(),
                  SizedBox(height: 32.h),
                  _buildCodeContainer(),
                  SizedBox(height: 24.h),
                  Text(
                    "Share your Referral Code via",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 530.h,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Row(
                  children: [
                    Image.asset(AppIcons.whatappIcon, height: 18.h),
                    SizedBox(width: 8.w),
                    Text(
                      "Whatsapp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Column _buildReferYourFriends() {
    return Column(
      children: [
        Text(
          "Refer your friends",
          style: TextStyle(
            fontSize: 32.h,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Invite your friend now",
          style: TextStyle(
            fontSize: 16.h,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 24.h),
        Image.asset(
          AppImages.bigGift,
          height: 144.h,
        ),
      ],
    );
  }

  Container _buildCodeContainer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(210, 167, 43, 189),
            Color.fromARGB(255, 233, 30, 233)
          ]),
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Invite using Referral link",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.h,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.h),
        DottedBorder(
          dashPattern: [6.w, 6.w],
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: Radius.circular(10.r),
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.w, right: 8.w, top: 6.h, bottom: 6.h),
              decoration:
                  // ignore: prefer_const_constructors
                  BoxDecoration(color: const Color.fromARGB(255, 233, 30, 233)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Code : Krutikasingh1008",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        _controler.copyRefferralCode();
                      },
                      icon: Icon(
                        Icons.copy,
                        size: 24.h,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
