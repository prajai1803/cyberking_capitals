import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'package:intl/intl.dart';

import 'view/scanner.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late final AttendanceController _controller;

  @override
  void initState() {
    _controller = Get.put(AttendanceController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
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
          actions: [
            IconButton(
                onPressed: () async {
                  _controller.fetchInitialData();
                },
                icon: const Icon(
                  Icons.refresh_outlined,
                ))
          ],
        ),
        body: GetBuilder(
            init: _controller,
            id: "Attendance Screen",
            builder: (_) => _controller.screenState == ScreenState.loading
                ? const Center(child: CircularProgressIndicator())
                : _controller.screenState == ScreenState.error
                    ? Center(
                        child: ElevatedButton(
                            onPressed: () => _controller.fetchInitialData(),
                            child: const Text("Try Again")),
                      )
                    : _controller.attendanceList.isEmpty
                        ? const Center(
                            child: Text(
                              "Attendance count not started yet.",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _controller.attendanceList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ExpansionTile(
                              backgroundColor: Colors.white,
                              collapsedBackgroundColor: Colors.white,
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 24.h,
                                  )),
                              shape: Border.all(
                                  width: 0, color: Colors.transparent),
                              title: Text(
                                "Batch: ${_controller.attendanceList[index].batchId ?? 0}",
                              ),
                              subtitle: Text(
                                "Batch Name: ${_controller.attendanceList[index].batchName ?? 0}",
                              ),
                              children: [
                                _buildAttendanceText(),
                                (_controller.attendanceList[index]
                                            .attendanceRecords !=
                                        null)
                                    ? ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: _controller
                                            .attendanceList[index]
                                            .attendanceRecords!
                                            .length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int x) {
                                          final attendanceRecord = _controller
                                              .attendanceList[index]
                                              .attendanceRecords;
                                          Color? backgroundColor = x % 2 == 0
                                              ? Colors.white
                                              : Colors.grey[200];
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: backgroundColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(DateFormat('dd-MMMM-yyyy')
                                                    .format(attendanceRecord![x]
                                                        .attendanceDate!)),
                                                Text(attendanceRecord[x]
                                                            .status! ==
                                                        "none"
                                                    ? "No class"
                                                    : attendanceRecord[x]
                                                        .status!
                                                        .toUpperCase())
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    : const Text("No Data Found"),
                                SizedBox(height: 20.h)
                              ],
                            ),
                          )));
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
