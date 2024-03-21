import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:cyberking_capitals/app/modules/home/view/progress_screen.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/list_tile.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/video_player.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/module_tile.dart';
import 'widgets/promo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              CircleCachedImage(
                imageUrl: "",
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
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    "Let’s start learning",
                    style:
                        TextStyle(fontSize: 12.h, color: AppColors.textBlack3),
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
            GetBuilder(
                init: _controller,
                id: "HomeSearch",
                builder: (_) {
                  return SizedBox(
                      child: (_controller.searchTextController.text.isEmpty)
                          ? Column(
                              children: [
                                IntroVideo(),
                                SizedBox(height: 24.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: const Divider(thickness: 1),
                                ),
                                SizedBox(height: 24.h),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Text(
                                    "Features Video Updates",
                                    style: TextStyle(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.iconRed,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                _buildCommingSoon(),
                                SizedBox(height: 10.h),
                                _buildModules(),
                                SizedBox(height: 24.h),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Text(
                                    "All Modules",
                                    style: TextStyle(
                                        fontSize: 16.h,
                                        color: AppColors.iconRed,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: ListView.builder(
                                      itemCount: _controller.videos.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoute.studyModule);
                                        },
                                        child: ModuleTile(
                                          description: _controller
                                              .videos[index].description,
                                          title:
                                              _controller.videos[index].title,
                                          index: index + 1,
                                          duration: _controller
                                              .videos[index].duration,
                                          session:
                                              _controller.videos[index].session,
                                        ),
                                      ),
                                    )),
                              ],
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: _controller.showVideos.isEmpty
                                  ? Text(
                                      "Data not found",
                                      style: TextStyle(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _controller.showVideos.length,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoute.studyModule);
                                        },
                                        child: ModuleTile(
                                          description: _controller
                                              .showVideos[index].description,
                                          title: _controller
                                              .showVideos[index].title,
                                          index: index,
                                          duration: _controller
                                              .showVideos[index].duration,
                                          session: _controller
                                              .showVideos[index].session,
                                        ),
                                      ),
                                    ),
                            ));
                }),
            SizedBox(height: 24.h),
          ],
        )),
      ),
    );
  }

  Column _buildModules() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Divider(thickness: 1),
        ),
        SizedBox(height: 10.h),
        CustomListTile(
          title: "Progress Bar",
          subTitle:
              "Track your learning  progress, goals,\nStreaks, Certificates and Quiz points earned.",
          colorCode: 0xeFE09C32,
          imageIcon: AppImages.progressIcon,
          onTap: () {
            Get.to(() => ProgressBarScreen());
          },
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Divider(thickness: 1),
        ),
        SizedBox(height: 10.h),
        const CustomListTile(
          title: "Module",
          subTitle:
              "Find all your module-related videos.\nand Start your learning process with us.",
          colorCode: 0xeF4184F3,
          imageIcon: AppImages.moduleIcon,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(.15),
                        borderRadius: BorderRadius.circular(15.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 31.w, vertical: 12.h),
                    child: Text(
                      "60+",
                      style: TextStyle(
                          fontSize: 24.h,
                          fontFamily: "Rakkas",
                          color: AppColors.secondary),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Session",
                    style:
                        TextStyle(fontSize: 12.h, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(.15),
                        borderRadius: BorderRadius.circular(15.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Text(
                      "120 Hr",
                      style: TextStyle(
                          fontSize: 24.h,
                          fontFamily: "Rakkas",
                          color: AppColors.secondary),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Duration",
                    style:
                        TextStyle(fontSize: 12.h, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(.15),
                        borderRadius: BorderRadius.circular(15.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                    child: Text(
                      "100%",
                      style: TextStyle(
                          fontSize: 24.h,
                          fontFamily: "Rakkas",
                          color: AppColors.secondary),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Status",
                    style:
                        TextStyle(fontSize: 12.h, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Divider(thickness: 1),
        ),
      ],
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
          child: const PromoWidget(
            title: "Stock Market Live Streaming",
            subtitle:
                "Write a little info about your video here as a description.",
            lowerText: "Start 10th Oct 2023, 12:00 PM",
            label: "Comming soon",
          )),
    );
  }

  Padding _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
            cursorHeight: 20,
            controller: _controller.searchTextController,
            onChanged: (value) => _controller.searchModule(value),
            decoration: InputDecoration(
              prefixIcon: Icon(
                CupertinoIcons.search,
                size: 24.r,
              ),
              contentPadding: EdgeInsets.only(top: 5.h),
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
