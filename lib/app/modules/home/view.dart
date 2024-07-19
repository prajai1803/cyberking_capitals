import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/core/values/icons.dart';
import 'package:cyberking_capitals/app/core/values/images.dart';
import 'package:cyberking_capitals/app/data/models/module_session_model.dart';
import 'package:cyberking_capitals/app/data/models/video_model.dart';
import 'package:cyberking_capitals/app/data/providers/session_db.dart';
import 'package:cyberking_capitals/app/modules/attendence/view/scanner.dart';
import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:cyberking_capitals/app/modules/home/view/intro_video.dart';
import 'package:cyberking_capitals/app/modules/home/view/progress_screen.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/intro_video_card.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/list_tile.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/loading_shimmer.dart';
import 'package:cyberking_capitals/app/modules/study_module/widgets/session_tile.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/utils/extension.dart';
import 'package:cyberking_capitals/app/widgets/app_update.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:cyberking_capitals/app/widgets/try_again.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import 'widgets/module_tile.dart';
import 'widgets/promo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<HomeController>();
  PackageInfo? _packageInfo;
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  @override
  Widget build(BuildContext context) {
    checkUpdate(context);
    return Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.profile);
                  },
                  child: Row(
                    children: [
                      GetBuilder(
                        init: _controller,
                        id: "Profile Image",
                        initState: (_) {},
                        builder: (_) {
                          return CircleCachedImage(
                            imageUrl: _controller.user?.profilePhoto ??
                                AppNetworkIcons.userIcon,
                            radius: 16.r,
                          );
                        },
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
                            style: TextStyle(
                                fontSize: 12.h, color: AppColors.textBlack3),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => QRScanner());
                    },
                    icon: Icon(
                      Icons.qr_code_scanner,
                      size: 24.h,
                    ))
              ],
            ),
          ),
        ),
        body: GetBuilder(
          init: _controller,
          id: "Loading Screen",
          builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              _controller.refreshInitialData();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                  child: _controller.screenState == ScreenState.loading
                      ? const ShimmerLoadingPage()
                      : _controller.screenState == ScreenState.error
                          ? TryAgain(
                              onPressed: () {
                                _controller.fetchInitialData();
                              },
                            )
                          : Column(
                              children: [
                                SizedBox(height: 16.h),
                                _buildSearchField(),
                                SizedBox(height: 20.h),
                                mainBody(),
                                SizedBox(height: 24.h),
                              ],
                            )),
            ),
          ),
        ));
  }

  GetBuilder<HomeController> mainBody() {
    return GetBuilder(
        init: _controller,
        id: "HomeSearch",
        builder: (_) {
          return SizedBox(
              child: (_controller.searchTextController.text.isEmpty)
                  ? Column(
                      children: [
                        _controller.introVideoModel == null
                            ? const SizedBox()
                            : _buildIntroVideo(),
                        // Feature video updates (dont remove)

                        // Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(
                        //           horizontal: 20.w),
                        //   child: const Divider(
                        //       thickness: 1),
                        // ),
                        // SizedBox(height: 24.h),
                        // Container(
                        //   alignment:
                        //       Alignment.centerLeft,
                        //   padding: EdgeInsets.only(
                        //       left: 16.w),
                        //   child: Text(
                        //     "Features Video Updates",
                        //     style: TextStyle(
                        //       fontSize: 18.h,
                        //       fontWeight:
                        //           FontWeight.w700,
                        //       color:
                        //           AppColors.iconRed,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 10.h),
                        // _buildCommingSoon(),
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
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ListView.builder(
                              itemCount: _controller.moduleList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.studyModule,
                                      arguments: _controller.moduleList[index]);
                                },
                                child: ModuleTile(
                                  description:
                                      _controller.moduleList[index].moduleDesc,
                                  title:
                                      _controller.moduleList[index].moduleName,
                                  index: index + 1,
                                  duration: (_controller.moduleList[index]
                                              .completionTimeHrs ??
                                          0)
                                      .toHHMM(),
                                  session: _controller
                                          .moduleList[index].sessions?.length ??
                                      0,
                                  thumbnail:
                                      _controller.moduleList[index].thumbnail,
                                ),
                              ),
                            )),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: _controller.showModulesAndSession.isEmpty
                          ? Text(
                              "Data not found",
                              style: TextStyle(
                                  fontSize: 14.h, fontWeight: FontWeight.w500),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  _controller.showModulesAndSession.length,
                              itemBuilder: (context, index) {
                                if (_controller.showModulesAndSession[index]
                                        .runtimeType ==
                                    Module) {
                                  Module module =
                                      _controller.showModulesAndSession[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.studyModule,
                                          arguments: module);
                                    },
                                    child: ModuleTile(
                                      description: module.moduleDesc,
                                      title: module.moduleName,
                                      index: index,
                                      duration:
                                          module.completionTimeHrs!.toHHMM(),
                                      session: module.sessionCount,
                                      thumbnail: module.thumbnail,
                                    ),
                                  );
                                } else {
                                  Session s = _controller
                                      .showModulesAndSession[index] as Session;
                                  return SessionTile(
                                    onTap: () {
                                      Get.toNamed(AppRoute.moduleVideo,
                                          arguments: {
                                            "videoModel": VideoModel(
                                                description: s.sessionDesc,
                                                title: s.sessionName,
                                                duration:
                                                    s.videoDuration!.toHHMM(),
                                                session: 2,
                                                videoId: s.sessionId,
                                                videoUrl: s.videoLink),
                                            "sessionCompletedList": []
                                          });
                                    },
                                    description: s.sessionDesc,
                                    session: s.sessionId,
                                    duration: s.videoDuration!.toHHMM(),
                                    title: s.sessionName,
                                    thumbnail: s.thumbnail,
                                    index: index,
                                  );
                                }
                              }),
                    ));
        });
  }

  Column _buildIntroVideo() {
    return Column(
      children: [
        // IntroVideo(),
        IntroVideoCard(
          thumbnail: _controller.introVideoModel?.thumbnail,
          onTap: () {
            Get.to(() => const IntroVideoPlayer(),
                arguments: _controller.introVideoModel);
          },
        ),
        SizedBox(height: 24.h),
      ],
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
            Get.to(() => const ProgressBarScreen());
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
                      "${_controller.sessionList.length}",
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
                      _controller.completionsHr.toHH(),
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
                      "0%",
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

  // ignore: unused_element
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: Colors.black45,
                        ),
                      ),
                      GetBuilder(
                        init: _controller,
                        id: "Mic",
                        initState: (_) {},
                        builder: (_) {
                          return InkWell(
                              onTap: () => _controller.speechRec(),
                              child: _controller.isVoiceRecording
                                  ? const Icon(Icons.mic)
                                  : const Icon(Icons.mic_off));
                        },
                      )
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

  void checkUpdate(context) async {
    _packageInfo ??= await PackageInfo.fromPlatform();

    if (_packageInfo == null) {
      return;
    }

    final appVersion = Version.parse(_packageInfo!.version);

    final lastNormalUpdateVersionString =
        _remoteConfig.getString("last_normal_update_version");

    final lastForceUpdateVersionString =
        _remoteConfig.getString("last_force_update_version");

    final downloadLink = _remoteConfig.getString("app_download_link");
    final updateContent = _remoteConfig.getString("update_content");

    final lastForceUpdateVersion = Version.parse(lastForceUpdateVersionString);

    final lastNormalUpdateVersion =
        Version.parse(lastNormalUpdateVersionString);

    if (lastForceUpdateVersion > appVersion) {
      await Future.delayed(const Duration(seconds: 2));
      AppUpdates.showAppUpdateForce(
        context,
        version: lastNormalUpdateVersion.toString(),
        link: downloadLink,
        updateContent: updateContent,
      );
    } else if (lastNormalUpdateVersion > appVersion) {
      SessionDB sessionDB = SessionDB();
      final isSkipUpdate = await sessionDB.getSkipUpdate();
      if (isSkipUpdate ?? false) {
        return;
      }
      await Future.delayed(const Duration(seconds: 2));
      AppUpdates.showAppUpdate(
        context,
        version: lastNormalUpdateVersionString,
        link: downloadLink,
        updateContent: updateContent,
      );
    }
  }
}
