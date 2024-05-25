// To parse this JSON data, do
//
//     final progressBarModel = progressBarModelFromJson(jsonString);

import 'dart:convert';

ProgressBarModel progressBarModelFromJson(String str) =>
    ProgressBarModel.fromJson(json.decode(str));

String progressBarModelToJson(ProgressBarModel data) =>
    json.encode(data.toJson());

class ProgressBarModel {
  final String? studentId;
  final int? sessionsCompleted;
  final int? modulesCompleted;
  final int? quizzesCompleted;

  ProgressBarModel({
    this.studentId,
    this.sessionsCompleted,
    this.modulesCompleted,
    this.quizzesCompleted,
  });

  ProgressBarModel copyWith({
    String? studentId,
    int? sessionsCompleted,
    int? modulesCompleted,
    int? quizzesCompleted,
  }) =>
      ProgressBarModel(
        studentId: studentId ?? this.studentId,
        sessionsCompleted: sessionsCompleted ?? this.sessionsCompleted,
        modulesCompleted: modulesCompleted ?? this.modulesCompleted,
        quizzesCompleted: quizzesCompleted ?? this.quizzesCompleted,
      );

  factory ProgressBarModel.fromJson(Map<String, dynamic> json) =>
      ProgressBarModel(
        studentId: json["student_id"],
        sessionsCompleted: json["sessions_completed"],
        modulesCompleted: json["modules_completed"],
        quizzesCompleted: json["quizzes_completed"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "sessions_completed": sessionsCompleted,
        "modules_completed": modulesCompleted,
        "quizzes_completed": quizzesCompleted,
      };
}
