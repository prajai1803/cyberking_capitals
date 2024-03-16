import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CircleCachedImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const CircleCachedImage(
      {super.key, required this.imageUrl, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png',
      imageBuilder: (context, imageProvider) => Container(
        width: (radius * 2).r,
        height: (radius * 2).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          width: (radius * 2).r,
          height: (radius * 2).r,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
          radius: radius.r,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.error,
            color: Colors.black,
          )),
    );
  }
}
