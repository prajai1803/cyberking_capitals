import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/modules/study_module/view/certificate.dart';
import 'package:cyberking_capitals/app/modules/study_module/widgets/glow_button.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class StudyModule extends StatefulWidget {
  const StudyModule({super.key});

  @override
  State<StudyModule> createState() => _StudyModuleState();
}

class _StudyModuleState extends State<StudyModule> {
  final _controller = Get.put(StudyModuleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Module Name")),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildHeader(),
        SizedBox(height: 32.h),
        _buildLearingRoad()
      ]),
    );
  }

  Widget _buildLearingRoad() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder(
              init: _controller,
              id: "all session",
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.toogleAllSession();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 4.w),
                            child: Text(
                              "All Session",
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            _controller.allSessionOpend
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            size: 24.h,
                          )
                        ],
                      ),
                    ),
                    _controller.allSessionOpend
                        ? IntrinsicHeight(
                            child: Row(
                              children: [
                                DottedVerticalLine(
                                  margin: EdgeInsets.only(left: 4.w),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 27.w, top: 37.h, bottom: 32.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Level progress:",
                                            style: TextStyle(
                                                fontSize: 12.h,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textBlack2),
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "00%",
                                            style: TextStyle(
                                                fontSize: 16.h,
                                                fontFamily: "Rakkas",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24.h),
                                      GlowButton(
                                        onTap: () {
                                          Get.toNamed(AppRoute.allSession);
                                        },
                                        text: "Explore",
                                        color: AppColors.secondary,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 48.h,
                                  child: DottedVerticalLine(
                                    margin: EdgeInsets.only(left: 4.w),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                );
              },
            ),
            GetBuilder(
              init: _controller,
              id: "quiz",
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.toogleQuiz();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: CircleAvatar(
                              radius: 7.r,
                              backgroundColor: Colors.green[100],
                              child: Icon(
                                Icons.lock_outline_rounded,
                                size: 10.h,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 4.w),
                            child: Text(
                              "Quiz",
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            _controller.quizOpend
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            size: 24.h,
                          )
                        ],
                      ),
                    ),
                    _controller.quizOpend
                        ? IntrinsicHeight(
                            child: Row(
                              children: [
                                DottedVerticalLine(
                                  margin: EdgeInsets.only(left: 4.w),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 27.w, top: 37.h, bottom: 32.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Quiz Score:",
                                            style: TextStyle(
                                                fontSize: 12.h,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textBlack2),
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "00/100",
                                            style: TextStyle(
                                                fontSize: 16.h,
                                                fontFamily: "Rakkas",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24.h),
                                      GlowButton(
                                        onTap: () {},
                                        text: "Attempt Quiz",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 48.h,
                                  child: DottedVerticalLine(
                                    margin: EdgeInsets.only(left: 4.w),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                );
              },
            ),
            GetBuilder(
              init: _controller,
              id: "certificate",
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.toogleCertificate();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: CircleAvatar(
                              radius: 7.r,
                              backgroundColor: Colors.green[100],
                              child: Icon(
                                Icons.lock_outline_rounded,
                                size: 10.h,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 4.w),
                            child: Text(
                              "Cerificate",
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            _controller.certificateOpend
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            size: 24.h,
                          )
                        ],
                      ),
                    ),
                    _controller.certificateOpend
                        ? IntrinsicHeight(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 34.w,
                                    top: 32.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GlowButton(
                                        onTap: () {
                                          Get.to(() => CertificateScreen());
                                        },
                                        text: "Download",
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      color: Colors.green[100],
      padding: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Module: ",
                style: TextStyle(
                  fontSize: 12.h,
                  color: AppColors.textBlack2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                "01",
                style: TextStyle(
                  fontSize: 16.h,
                  fontFamily: "Rakkas",
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "Stock Market Basic",
            style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(right: 35.w),
            child: Text(
              "This meta-description generator uses a machine learning (GPT-3 from Open AI) to generate short description ideas for your articles.",
              style: TextStyle(
                fontSize: 12.h,
                color: AppColors.textBlack2,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
