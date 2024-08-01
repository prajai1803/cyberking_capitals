import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/data/models/feature_model.dart';
import 'package:cyberking_capitals/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LiveVideoScreen extends StatefulWidget {
  const LiveVideoScreen({super.key});

  @override
  State<LiveVideoScreen> createState() => _LiveVideoScreenState();
}

class _LiveVideoScreenState extends State<LiveVideoScreen> {
  late final FeatureModel featureModel;
  final _controller = Get.find<HomeController>();
  @override
  void initState() {
    featureModel = Get.arguments as FeatureModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Video",
          style: TextStyle(fontSize: 16.h),
        ),
      ),
      body: Column(
        children: [
          CachedNetworkImage(imageUrl: featureModel.thumbnail ?? ""),
          SizedBox(height: 16.h),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  featureModel.title ?? "",
                  style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8.h),
                Text(
                  featureModel.description ?? "",
                  style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlack2),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: featureModel.tag == "LIVE"
                                ? Colors.red[700]
                                : Colors.blue[700],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            if (featureModel.tag == "LIVE")
                              Icon(
                                Icons.wifi,
                                size: 12.h,
                                color: Colors.white,
                              ),
                            SizedBox(width: 6.w),
                            Text(
                              featureModel.tag == "LIVE"
                                  ? "LIVE"
                                  : "Comming Soon",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.h,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                    SizedBox(width: 12.w),
                    Text(
                      "Start ${DateFormat("dd MMM yyyy, hh:mm a").format(featureModel.scheduleTime ?? DateTime.now())}",
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBlack2),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: ElevatedButton(
                        onPressed: () =>
                            _controller.openInWeb(featureModel.link),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.h,
                              padding: EdgeInsets.all(4.h),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: CachedNetworkImage(
                                  imageUrl: featureModel.icon ?? ""),
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              "Join Now",
                              style: TextStyle(
                                  fontSize: 16.h, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
