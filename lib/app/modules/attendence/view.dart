import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/scanner.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => QRScanner()),
        child: const Icon(Icons.qr_code_scanner),
      ),
      backgroundColor: const Color(0xefF5F6FB),
      appBar: AppBar(
        title: Text(
          "Attendance",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.h,
          ),
        ),
      ),
      body: Column(
        children: [
          ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 24.h,
                )),
            shape: Border.all(width: 0, color: Colors.transparent),
            title: const Text(
              "Class: ",
            ),
            subtitle: const Text(
              "Created On: ",
            ),
            children: [
              _buildAttendanceText(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int x) {
                  Color? backgroundColor =
                      x % 2 == 0 ? Colors.white : Colors.grey[200];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    color: backgroundColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("date"), Text("Present")],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ],
      ),
    );
  }

  Container _buildAttendanceText() {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(33, 0, 147, 1),
            Color.fromRGBO(133, 6, 245, 1)
          ],
              stops: [
            0.1,
            1
          ])),
      child: Center(
          child: Text(
        "Attendance History",
        style: TextStyle(
            fontSize: 14.h, fontWeight: FontWeight.w600, color: Colors.white),
      )),
    );
  }
}
