import 'package:cyberking_capitals/app/modules/community/view/chat_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/chat_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Community",
          style: TextStyle(fontSize: 16.h),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              size: 24.h,
            ),
          )
        ],
      ),
      body: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) => ChatCard(
                onTap: () {
                  Get.to(() => ChatScreen());
                },
                chatName: "Prakhar Jaiswal",
                data: "18/03/2024",
              )),
    );
  }
}
