// To parse this JSON data, do
//
//     final moduleRecordModel = moduleRecordModelFromJson(jsonString);

import 'dart:convert';

ModuleRecordModel moduleRecordModelFromJson(String str) =>
    ModuleRecordModel.fromJson(json.decode(str));

String moduleRecordModelToJson(ModuleRecordModel data) =>
    json.encode(data.toJson());

class ModuleRecordModel {
  final int? moduleId;
  final int? totalSessions;
  final int? completedSessions;
  final String? completionPercentage;
  final List<dynamic>? completedSessionIds;
  final List<dynamic>? quizScore;

  ModuleRecordModel({
    this.moduleId,
    this.totalSessions,
    this.completedSessions,
    this.completionPercentage,
    this.completedSessionIds,
    this.quizScore,
  });

  ModuleRecordModel copyWith({
    int? moduleId,
    int? totalSessions,
    int? completedSessions,
    String? completionPercentage,
    List<dynamic>? completedSessionIds,
    List<dynamic>? quizScore,
  }) =>
      ModuleRecordModel(
        moduleId: moduleId ?? this.moduleId,
        totalSessions: totalSessions ?? this.totalSessions,
        completedSessions: completedSessions ?? this.completedSessions,
        completionPercentage: completionPercentage ?? this.completionPercentage,
        completedSessionIds: completedSessionIds ?? this.completedSessionIds,
        quizScore: quizScore ?? this.quizScore,
      );

  factory ModuleRecordModel.fromJson(Map<String, dynamic> json) =>
      ModuleRecordModel(
        moduleId: json["module_id"],
        totalSessions: json["totalSessions"],
        completedSessions: json["completedSessions"],
        completionPercentage: json["completionPercentage"],
        completedSessionIds: json["completedSessionIds"] == null
            ? []
            : List<dynamic>.from(json["completedSessionIds"]!.map((x) => x)),
        quizScore: json["quiz_score"] == null
            ? []
            : List<dynamic>.from(json["quiz_score"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "module_id": moduleId,
        "totalSessions": totalSessions,
        "completedSessions": completedSessions,
        "completionPercentage": completionPercentage,
        "completedSessionIds": completedSessionIds == null
            ? []
            : List<dynamic>.from(completedSessionIds!.map((x) => x)),
        "quiz_score": quizScore == null
            ? []
            : List<dynamic>.from(quizScore!.map((x) => x)),
      };
}
