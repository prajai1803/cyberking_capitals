// To parse this JSON data, do
//
//     final moduleRecordModel = moduleRecordModelFromJson(jsonString);

import 'dart:convert';

ModuleRecordModel moduleRecordModelFromJson(String str) =>
    ModuleRecordModel.fromJson(json.decode(str));

String moduleRecordModelToJson(ModuleRecordModel data) =>
    json.encode(data.toJson());

class ModuleRecordModel {
  final int? studentId;
  final int? moduleId;
  final int? totalSessions;
  final int? completedSessions;
  final String? completionPercentage;
  final List<int>? completedSessionIds;
  final int? quizScore;

  ModuleRecordModel({
    this.studentId,
    this.moduleId,
    this.totalSessions,
    this.completedSessions,
    this.completionPercentage,
    this.completedSessionIds,
    this.quizScore,
  });

  ModuleRecordModel copyWith({
    int? studentId,
    int? moduleId,
    int? totalSessions,
    int? completedSessions,
    String? completionPercentage,
    List<int>? completedSessionIds,
    int? quizScore,
  }) =>
      ModuleRecordModel(
        studentId: studentId ?? this.studentId,
        moduleId: moduleId ?? this.moduleId,
        totalSessions: totalSessions ?? this.totalSessions,
        completedSessions: completedSessions ?? this.completedSessions,
        completionPercentage: completionPercentage ?? this.completionPercentage,
        completedSessionIds: completedSessionIds ?? this.completedSessionIds,
        quizScore: quizScore ?? this.quizScore,
      );

  factory ModuleRecordModel.fromJson(Map<String, dynamic> json) =>
      ModuleRecordModel(
        studentId: json["student_id"],
        moduleId: json["module_id"],
        totalSessions: json["totalSessions"],
        completedSessions: json["completedSessions"],
        completionPercentage: json["completionPercentage"],
        completedSessionIds: json["completedSessionIds"] == null
            ? []
            : List<int>.from(json["completedSessionIds"]!.map((x) => x)),
        quizScore: json["quiz_score"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "module_id": moduleId,
        "totalSessions": totalSessions,
        "completedSessions": completedSessions,
        "completionPercentage": completionPercentage,
        "completedSessionIds": completedSessionIds == null
            ? []
            : List<dynamic>.from(completedSessionIds!.map((x) => x)),
        "quiz_score": quizScore,
      };
}
