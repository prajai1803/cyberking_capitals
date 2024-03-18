import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/modules/home/widgets/progress_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressBarScreen extends StatelessWidget {
  ProgressBarScreen({super.key});

  final List<ChartData> chartData = [
    ChartData('David', 10, AppColors.chartPurpal),
    ChartData('Steve', 10, AppColors.chartOrange),
    ChartData('Jack', 10, AppColors.chartGreen),
    ChartData('Others', 10, AppColors.chartPink)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Progress Bar",
          style: TextStyle(
              fontSize: 16.h, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi krutika",
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  "This is your progress report.",
                  style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack2),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
                height: 172.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.secondary),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SfCircularChart(series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          pointColorMapper: (ChartData data, _) => data.color,
                          explode: true,
                          explodeAll: true,
                          explodeOffset: "1%",
                        )
                      ]),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 38.h, bottom: 38.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18.h,
                                  width: 18.h,
                                  margin: EdgeInsets.only(right: 12.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.chartPurpal,
                                      borderRadius: BorderRadius.circular(5.r)),
                                ),
                                Text("Session",
                                    style: TextStyle(fontSize: 12.h))
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18.h,
                                  width: 18.h,
                                  margin: EdgeInsets.only(right: 12.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.chartOrange,
                                      borderRadius: BorderRadius.circular(5.r)),
                                ),
                                Text("Module", style: TextStyle(fontSize: 12.h))
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18.h,
                                  width: 18.h,
                                  margin: EdgeInsets.only(right: 12.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.chartGreen,
                                      borderRadius: BorderRadius.circular(5.r)),
                                ),
                                Text("Quiz", style: TextStyle(fontSize: 12.h))
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18.h,
                                  width: 18.h,
                                  margin: EdgeInsets.only(right: 12.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.chartPink,
                                      borderRadius: BorderRadius.circular(5.r)),
                                ),
                                Text("Live", style: TextStyle(fontSize: 12.h))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 24.h),
            const Divider(thickness: 1),
            SizedBox(height: 24.h),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProgressTile(
                      color: AppColors.chartPurpal,
                      value: "32/45",
                      title: "Session Completed",
                    ),
                    ProgressTile(
                      color: AppColors.chartOrange,
                      value: "32/45",
                      title: "Module Completed",
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProgressTile(
                      color: AppColors.chartGreen,
                      value: "32/45",
                      title: "Quiz Completed",
                    ),
                    ProgressTile(
                      color: AppColors.chartPink,
                      value: "32/45",
                      title: "Live Completed",
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color? color;
}
