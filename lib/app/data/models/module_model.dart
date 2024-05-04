// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'dart:convert';

ModuleModel moduleModelFromJson(String str) =>
    ModuleModel.fromJson(json.decode(str));

String moduleModelToJson(ModuleModel data) => json.encode(data.toJson());

class ModuleModel {
  final int? moduleId;
  final String? moduleName;
  final String? moduleDesc;
  final dynamic noOfSessions;
  final dynamic completionTimeHrs;
  final String? thumbnail;
  final dynamic publish;
  final String? moduleLevel;
  final int? noOfQuetions;
  final String? moduleDeeplink;
  final String? thumbnailPublicId;
  final DateTime? scheduleTime;

  ModuleModel({
    this.moduleId,
    this.moduleName,
    this.moduleDesc,
    this.noOfSessions,
    this.completionTimeHrs,
    this.thumbnail,
    this.publish,
    this.moduleLevel,
    this.noOfQuetions,
    this.moduleDeeplink,
    this.thumbnailPublicId,
    this.scheduleTime,
  });

  ModuleModel copyWith({
    int? moduleId,
    String? moduleName,
    String? moduleDesc,
    dynamic noOfSessions,
    dynamic completionTimeHrs,
    String? thumbnail,
    dynamic publish,
    String? moduleLevel,
    int? noOfQuetions,
    String? moduleDeeplink,
    String? thumbnailPublicId,
    DateTime? scheduleTime,
  }) =>
      ModuleModel(
        moduleId: moduleId ?? this.moduleId,
        moduleName: moduleName ?? this.moduleName,
        moduleDesc: moduleDesc ?? this.moduleDesc,
        noOfSessions: noOfSessions ?? this.noOfSessions,
        completionTimeHrs: completionTimeHrs ?? this.completionTimeHrs,
        thumbnail: thumbnail ?? this.thumbnail,
        publish: publish ?? this.publish,
        moduleLevel: moduleLevel ?? this.moduleLevel,
        noOfQuetions: noOfQuetions ?? this.noOfQuetions,
        moduleDeeplink: moduleDeeplink ?? this.moduleDeeplink,
        thumbnailPublicId: thumbnailPublicId ?? this.thumbnailPublicId,
        scheduleTime: scheduleTime ?? this.scheduleTime,
      );

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        moduleId: json["module_id"],
        moduleName: json["module_name"],
        moduleDesc: json["module_desc"],
        noOfSessions: json["no_of_sessions"],
        completionTimeHrs: json["completion_time_hrs"],
        thumbnail: json["thumbnail"],
        publish: json["publish"],
        moduleLevel: json["module_level"],
        noOfQuetions: json["no_of_quetions"],
        moduleDeeplink: json["module_deeplink"],
        thumbnailPublicId: json["thumbnail_publicId"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
      );

  Map<String, dynamic> toJson() => {
        "module_id": moduleId,
        "module_name": moduleName,
        "module_desc": moduleDesc,
        "no_of_sessions": noOfSessions,
        "completion_time_hrs": completionTimeHrs,
        "thumbnail": thumbnail,
        "publish": publish,
        "module_level": moduleLevel,
        "no_of_quetions": noOfQuetions,
        "module_deeplink": moduleDeeplink,
        "thumbnail_publicId": thumbnailPublicId,
        "schedule_time": scheduleTime?.toIso8601String(),
      };
}
