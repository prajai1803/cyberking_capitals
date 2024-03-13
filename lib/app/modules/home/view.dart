import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/video_player.dart';
import 'package:cyberking_capitals/app/widgets/dotted_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16.r,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi Traders",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    "Let’s start learning",
                    style:
                        TextStyle(fontSize: 12.sp, color: AppColors.textBlack3),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 16.h),
            _buildSearchField(),
            SizedBox(height: 20.h),
            IntroVideo(),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(thickness: 1),
            ),
            SizedBox(height: 24.h),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                "Features Video Updates",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.iconRed,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            _buildCommingSoon(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(thickness: 1),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16.h,
                    backgroundColor: const Color(0xeFE09C32).withOpacity(.20),
                    child: ImageIcon(
                        const AssetImage(
                          AppImages.progressIcon,
                        ),
                        size: 16.h,
                        color: const Color(0xeFE09C32)),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Progress Bar",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Sell all",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondary),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Track your learning  progress, goals,\nStreaks, Certificates and Quiz points earned.",
                          style: TextStyle(
                              fontSize: 12.sp,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack3),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(thickness: 1),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16.h,
                    backgroundColor: AppColors.secondary.withOpacity(.20),
                    child: ImageIcon(
                        const AssetImage(
                          AppImages.moduleIcon,
                        ),
                        size: 16.h,
                        color: AppColors.secondary),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Module",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Sell all",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondary),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Find all your module-related videos.\nand Start your learning process with us.",
                          style: TextStyle(
                              fontSize: 12.sp,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack3),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Column(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 31.w, vertical: 10.h),
            //           decoration: BoxDecoration(
            //               color: Colors.amber,
            //               borderRadius: BorderRadius.circular(15.r)),
            //           child: Text(
            //             "60 +",
            //             style: TextStyle(
            //                 fontSize: 24.sp,
            //                 fontWeight: FontWeight.w700,
            //                 color: AppColors.secondary),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 10.h,
            //         ),
            //         Text(
            //           "Session",
            //           style: TextStyle(
            //             fontSize: 12.sp,
            //             fontWeight: FontWeight.w700,
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Divider(thickness: 1),
            ),
          ],
        )),
      ),
    );
  }

  ListView _buildCommingSoon() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        height: 290.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.15))
            ],
            borderRadius: BorderRadius.circular(15.r)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 180.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r)))),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 12.w, right: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stock Market Live Streaming",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Write a little info about your video here as a description.",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textBlack3,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),
                      const DottedDivider(),
                      SizedBox(height: 8.h),
                      Text(
                        "Start 10th Oct 2023, 12:00 PM",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textBlack3,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 120.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      const AssetImage(AppImages.union),
                      color: Colors.white,
                      size: 115.h,
                    ),
                    Positioned(
                        top: 44.h,
                        child: Text(
                          "Comming Soon",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Padding _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 48.h,
        child: TextFormField(
            cursorHeight: 20,
            decoration: InputDecoration(
              prefixIcon: Icon(
                CupertinoIcons.search,
                size: 24.r,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: Colors.black45,
                        ),
                      ),
                      Icon(Icons.mic)
                    ]),
              ),
              suffixIconColor: AppColors.iconRed,
              prefixIconColor: AppColors.iconRed,
              hintText: "Search Here",
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: AppColors.iconRed)),
            )),
      ),
    );
  }
}
