import 'package:cyberking_capitals/app/core/colors/app_color.dart';
import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/modules/quiz/controller.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewAnswer extends StatelessWidget {
  ViewAnswer({super.key});

  final _controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Answer"),
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
                    children: [_buildPage(), _buildPageNumber()],
                  ),
                ),
        ));
  }

  GetBuilder<QuizController> _buildPageNumber() {
    return GetBuilder(
      init: _controller,
      id: "Page Number",
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (_controller.answerPageController.page != 0)
                    ? InkWell(
                        onTap: () {
                          _controller.answerPreviousPage();
                        },
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: _controller.getCurrentPage() == 0
                                ? Colors.grey[400]
                                : Colors.green[100],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 11.h,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Text(
                  "${(_controller.answerPageController.page ?? 0).toInt() + 1}/${_controller.quiz.length}",
                  style: TextStyle(
                    fontSize: 24.h,
                    fontFamily: "Rakkas",
                  ),
                ),
                (_controller.answerPageController.page !=
                        _controller.quiz.length - 1)
                    ? InkWell(
                        onTap: () {
                          if (_controller.selectedAnswerList[
                                  _controller.getCurrentPage()] ==
                              null) {
                            CommonAlerts.showErrorSnack(
                                message: "Please select any options");
                          } else {
                            _controller.answerNextPage();
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
                    : const SizedBox()
              ],
            ),
            SizedBox(
              height: 66.h,
            )
          ],
        );
      },
    );
  }

  Expanded _buildPage() {
    return Expanded(
      child: PageView.builder(
        controller: _controller.answerPageController,
        itemCount: _controller.quiz.length,
        itemBuilder: (context, questionIndex) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q.${questionIndex + 1}",
              style: TextStyle(fontFamily: "Rakkas", fontSize: 24.h),
            ),
            SizedBox(height: 16.h),
            Text(
              _controller.quiz[questionIndex].question.toString(),
              style: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 32.h),
            _buildAnswer(questionIndex),
          ],
        ),
      ),
    );
  }

  GetBuilder<QuizController> _buildAnswer(int questionIndex) {
    return GetBuilder(
      init: _controller,
      id: "Answer",
      initState: (_) {},
      builder: (_) {
        final options = _controller.quiz[questionIndex].options as List;
        return ListView.builder(
            itemCount: options.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
                  children: [
                    Radio(
                        value: index,
                        groupValue:
                            _controller.selectedAnswerList[questionIndex],
                        fillColor: index ==
                                _controller.correctAnswerList[questionIndex]
                            ? MaterialStateProperty.all(Colors.green)
                            : index ==
                                    _controller
                                        .selectedAnswerList[questionIndex]
                                ? MaterialStateProperty.all(Colors.red)
                                : MaterialStateProperty.all(Colors.grey),
                        onChanged: null),
                    Expanded(
                      child: Text(
                        options[index],
                        style: TextStyle(
                            fontSize: 12.h,
                            color: index ==
                                    _controller.correctAnswerList[questionIndex]
                                ? Colors.green
                                : index ==
                                        _controller
                                            .selectedAnswerList[questionIndex]
                                    ? Colors.red
                                    : AppColors.textBlack2),
                      ),
                    )
                  ],
                ));
      },
    );
  }
}
