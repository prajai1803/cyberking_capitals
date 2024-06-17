import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/study_module/controller/certificate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late final CertificateController _controller;

  @override
  void initState() {
    _controller = Get.put(CertificateController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Certificate"),
        ),
        body: GetBuilder(
            init: _controller,
            id: "Main Screen",
            builder: (controller) => _controller.screenState ==
                    ScreenState.loaded
                ? Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Screenshot(
                        controller: _controller.screenshotController,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Image.asset(
                                  AppImages.ribon,
                                  height: 160.h,
                                ),
                              ),
                              Positioned(
                                top: 120.h,
                                right: 5.w,
                                child: Image.asset(
                                  AppImages.redLogo,
                                  height: 70.h,
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 115.h),
                                    _buildSideTag(),
                                    SizedBox(height: 48.h),
                                    _buildCongratulation(),
                                    SizedBox(height: 32.h),
                                    _buildTechnicalAnalysis(),
                                    SizedBox(height: 48.h),
                                    _buildScoreAndDate(),
                                    SizedBox(height: 60.h),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 9.h,
                                  horizontal: 9.w,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border:
                                        Border.all(color: AppColors.secondary)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.download,
                                      size: 16.r,
                                      color: AppColors.secondary,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Order Now",
                                      style: TextStyle(
                                          fontSize: 12.h,
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _controller.downloadCertificate();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 9.h,
                                  horizontal: 9.w,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border:
                                        Border.all(color: AppColors.secondary)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.download,
                                      size: 16.r,
                                      color: AppColors.secondary,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "Download",
                                      style: TextStyle(
                                          fontSize: 12.h,
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => _controller.shareCertificate(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 9.h,
                                  horizontal: 9.w,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border:
                                        Border.all(color: AppColors.secondary)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.share_outlined,
                                      size: 16.r,
                                      color: AppColors.secondary,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "share",
                                      style: TextStyle(
                                          fontSize: 12.h,
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }

  Row _buildScoreAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "${_controller.certificateModel?.quizScore ?? 0}",
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: "Rakkas",
                color: AppColors.secondary,
              ),
            ),
            Text(
              "Point scored:",
              style: TextStyle(
                  fontSize: 12.h,
                  color: AppColors.textBlack2,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: [
            Text(
              DateFormat("dd/MM/yyyy")
                  .format(_controller.certificateModel!.createdAt!),
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: "Rakkas",
                color: AppColors.secondary,
              ),
            ),
            Text(
              "Issued on:",
              style: TextStyle(
                  fontSize: 12.h,
                  color: AppColors.textBlack2,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }

  Column _buildTechnicalAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_controller.certificateModel?.moduleName ?? "",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
            )),
        Container(
          width: 40.w,
          height: 4.h,
          margin: EdgeInsets.only(top: 6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.secondary),
        ),
      ],
    );
  }

  Column _buildCongratulation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Congratulations, ${_controller.certificateModel?.studentName} !",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 12.h),
        Text(
            "You have successfully completed the mandatory requirements prescribed by Student App and passed the certification program in",
            style: TextStyle(
              fontSize: 14.h,
              color: AppColors.textBlack3,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }

  Column _buildSideTag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Certificate of",
            style: TextStyle(
              fontFamily: "Playball",
              fontSize: 16.h,
            )),
        Text("Completion",
            style: TextStyle(
                fontFamily: "Playball",
                fontSize: 40.h,
                color: AppColors.secondary)),
      ],
    );
  }
}
