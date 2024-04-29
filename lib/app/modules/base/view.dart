import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/icons.dart';
import 'package:cyberking_capitals/app/modules/attendence/view.dart';
import 'package:cyberking_capitals/app/modules/bookmark/view.dart';
// import 'package:cyberking_capitals/app/modules/community/view.dart';
import 'package:cyberking_capitals/app/modules/history/view.dart';
import 'package:cyberking_capitals/app/modules/home/view.dart';
import 'package:cyberking_capitals/app/utils/network_manager.dart';
import 'package:cyberking_capitals/app/widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'controller.dart';
import 'widgets/rounded_tab_indicator.dart';

class AppBaseScreen extends StatefulWidget {
  const AppBaseScreen({super.key});

  @override
  State<AppBaseScreen> createState() => _AppBaseScreenState();
}

class _AppBaseScreenState extends State<AppBaseScreen>
    with TickerProviderStateMixin {
  final _controller = Get.find<AppBaseController>();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabListener);
    _tabController.dispose();
    super.dispose();
  }

  void _tabListener() {
    _controller.currentIndex.value = _tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      GetBuilder<NetworkManagerController>(
          init: NetworkManagerController(),
          builder: (controller) {
            if (controller.connectionType != 0) {
              return const HomeScreen();
            } else {
              return const NoInternetScreen();
            }
          }),
      // const CommunityScreen(),
      const BookMarkScreen(),
      const AttendanceScreen(),
      const BookMarkScreen(),
      // const BookMarkScreen(),

      // const BookMarkScreen(),
      // const ProfileScreen(),
      const HistoryScreen(),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(
          index: _controller.currentIndex.value, children: screens)),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildTabBar()],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 56.h,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: .5))),
      child: TabBar(
        controller: _tabController,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        overlayColor: MaterialStateProperty.all(AppColors.secondary),
        unselectedLabelColor: Colors.black,
        labelColor: AppColors.secondary,
        unselectedLabelStyle: TextStyle(
          fontFamily: "PJS",
          fontSize: 12.h,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.visible,
        ),
        labelStyle: TextStyle(
          fontFamily: "PJS",
          fontSize: 12.h,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.visible,
        ),
        indicator: RoundedTabIndicator(height: 52.h),
        tabs: [
          Tab(
            icon: ImageIcon(const AssetImage(AppIcons.home), size: 24.h),
            iconMargin: const EdgeInsets.symmetric(vertical: 6),
            text: "Home",
          ),
          Tab(
            icon: ImageIcon(const AssetImage(AppIcons.community), size: 24.h),
            iconMargin: const EdgeInsets.symmetric(vertical: 6),
            text: "Community",
          ),
          Tab(
            icon: ImageIcon(const AssetImage(AppIcons.attendance), size: 24.h),
            iconMargin: const EdgeInsets.symmetric(vertical: 6),
            text: "Attendance",
          ),
          Tab(
            icon: Icon(
              Icons.bookmark_outline,
              size: 24.h,
            ),
            iconMargin: const EdgeInsets.symmetric(vertical: 6),
            text: "Bookmark",
          ),
          Tab(
            icon: ImageIcon(const AssetImage(AppIcons.histroy), size: 24.h),
            iconMargin: const EdgeInsets.symmetric(vertical: 6),
            text: "History",
          ),
        ],
      ),
    );
  }
}
