import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroVideoCard extends StatelessWidget {
  final String? thumbnail;
  final void Function()? onTap;
  const IntroVideoCard({super.key, this.thumbnail, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                    thumbnail ?? "",
                  ))),
          child: Center(
            child: CircleAvatar(
              radius: 28.r,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.play_arrow,
                size: 24.r,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
