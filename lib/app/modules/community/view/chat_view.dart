import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 30.w,
          toolbarHeight: 60.h,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Icon(
                Icons.arrow_back,
                size: 24.h,
              ),
            ),
          ),
          title: Row(
            children: [
              const CircleCachedImage(imageUrl: "imageUrl", radius: 24),
              SizedBox(width: 6.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prakhar Jaiswal",
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Online",
                    style:
                        TextStyle(fontSize: 12.h, color: AppColors.textBlack3),
                  )
                ],
              )
            ],
          ),
        ),
        body: SizedBox(
          height: screenUtil.screenHeight,
          width: screenUtil.screenWidth,
          child: Stack(children: [
            ListView(),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 6.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.textBlack2),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message..",
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: AppColors.textBlack2),
                              prefixIcon: IconButton(
                                icon: const CircleAvatar(
                                  radius: 22,
                                  backgroundColor: AppColors.secondary,
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (builder) => bottomSheet());
                                },
                              )),
                        )),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.secondary,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 150.h,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconCreation(Icons.camera_alt, const Color(0xeFFF2E74), "Camera"),
              SizedBox(
                width: 32.w,
              ),
              iconCreation(
                  Icons.poll_rounded, const Color(0xeF4184F3), "Poll/Servey"),
              SizedBox(
                width: 32.w,
              ),
              iconCreation(
                  Icons.quiz_outlined, const Color(0xeFEDC111), "Quiz"),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29.h,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.h,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}
