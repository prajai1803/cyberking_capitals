import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/profile/widgets/achievement_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyAchievementScreen extends StatelessWidget {
  const MyAchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xeFF5F6FB),
      extendBody: true,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTopBanner(),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => const AchievementCard(
                      title: "Stock Market Services Stock Market Services",
                      percentage: 20,
                      image: "",
                    )),
          )
        ],
      ),
    );
  }

  Container _buildTopBanner() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xeF210093),
            Color(0xeF8506F5),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "My Achievements",
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.star,
                        height: 18.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Issued Certificates - 18",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Image.asset(
              AppImages.medal,
              height: 136.h,
            ),
          ),
        ],
      ),
    );
  }
}
