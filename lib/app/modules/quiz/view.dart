import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/modules/quiz/controller.dart';
import 'package:cyberking_capitals/app/modules/study_module/widgets/glow_button.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  final _controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
        ),
        body: GetBuilder(
          init: _controller,
          id: "Main Screen",
          builder: (_) => _controller.screenState == ScreenState.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _controller.pageController,
                          itemCount: _controller.quiz.length,
                          itemBuilder: (context, questionIndex) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q.${questionIndex + 1}",
                                style: TextStyle(
                                    fontFamily: "Rakkas", fontSize: 24.h),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                _controller.quiz[questionIndex].question
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 32.h),
                              GetBuilder(
                                init: _controller,
                                id: "Answer",
                                initState: (_) {},
                                builder: (_) {
                                  final options = _controller
                                      .quiz[questionIndex].options as List;
                                  return ListView.builder(
                                      itemCount: options.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => Row(
                                            children: [
                                              Radio(
                                                  value: index,
                                                  groupValue: _controller
                                                          .selectedAnswerList[
                                                      questionIndex],
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green),
                                                  onChanged: (v) {
                                                    _controller.selectAnswer(
                                                        questionIndex, v);
                                                  }),
                                              Text(
                                                options[index],
                                                style: TextStyle(
                                                    fontSize: 12.h,
                                                    color:
                                                        AppColors.textBlack2),
                                              )
                                            ],
                                          ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: _controller,
                        id: "Page Number",
                        initState: (_) {},
                        builder: (_) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // previous button
                                  // InkWell(
                                  //   onTap: () {
                                  //     _controller.previousPage();
                                  //   },
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(6.r),
                                  //     decoration: BoxDecoration(
                                  //       color: _controller.getCurrentPage() == 0
                                  //           ? Colors.grey[400]
                                  //           : Colors.green[100],
                                  //       shape: BoxShape.circle,
                                  //     ),
                                  //     child: Icon(
                                  //       Icons.arrow_back_ios_new_outlined,
                                  //       size: 11.h,
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      _controller.previousPage();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                    ),
                                  ),

                                  _controller.getCurrentPage() ==
                                          _controller.quiz.length - 1
                                      ? GlowButton(
                                          text: "Submit",
                                          color: AppColors.secondary,
                                          onTap: () {
                                            if (_controller.selectedAnswerList[
                                                    _controller
                                                        .getCurrentPage()] ==
                                                null) {
                                              CommonAlerts.showErrorSnack(
                                                  message:
                                                      "Please select any options");
                                            } else {
                                              _controller.submit();
                                            }
                                          },
                                        )
                                      : Text(
                                          "${(_controller.pageController.page ?? 0).toInt() + 1}/${_controller.quiz.length}",
                                          style: TextStyle(
                                            fontSize: 24.h,
                                            fontFamily: "Rakkas",
                                          ),
                                        ),
                                  _controller.getCurrentPage() ==
                                          _controller.quiz.length - 1
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            if (_controller.selectedAnswerList[
                                                    _controller
                                                        .getCurrentPage()] ==
                                                null) {
                                              CommonAlerts.showErrorSnack(
                                                  message:
                                                      "Please select any options");
                                            } else {
                                              _controller.nextPage();
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6.r),
                                            decoration: BoxDecoration(
                                              color: Colors.green[100],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 11.h,
                                            ),
                                          ),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 66.h,
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
        ));
  }
}
