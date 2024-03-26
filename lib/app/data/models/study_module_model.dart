import 'dart:convert';

StudyModuleModel studyModuleModelFromJson(String str) =>
    StudyModuleModel.fromJson(json.decode(str));

String studyModuleModelToJson(StudyModuleModel data) =>
    json.encode(data.toJson());

class StudyModuleModel {
  final int? batchModuleId;
  final int? batchId;
  final int? moduleId;
  final int? isActive;
  final String? batchName;
  final String? batchDesc;
  final DateTime? batchOpenDate;
  final String? batchImage;
  final String? moduleName;
  final String? moduleDesc;
  final int? noOfSessions;
  final dynamic completionTimeHrs;

  StudyModuleModel({
    this.batchModuleId,
    this.batchId,
    this.moduleId,
    this.isActive,
    this.batchName,
    this.batchDesc,
    this.batchOpenDate,
    this.batchImage,
    this.moduleName,
    this.moduleDesc,
    this.noOfSessions,
    this.completionTimeHrs,
  });

  StudyModuleModel copyWith({
    int? batchModuleId,
    int? batchId,
    int? moduleId,
    int? isActive,
    String? batchName,
    String? batchDesc,
    DateTime? batchOpenDate,
    String? batchImage,
    String? moduleName,
    String? moduleDesc,
    int? noOfSessions,
    dynamic completionTimeHrs,
  }) =>
      StudyModuleModel(
        batchModuleId: batchModuleId ?? this.batchModuleId,
        batchId: batchId ?? this.batchId,
        moduleId: moduleId ?? this.moduleId,
        isActive: isActive ?? this.isActive,
        batchName: batchName ?? this.batchName,
        batchDesc: batchDesc ?? this.batchDesc,
        batchOpenDate: batchOpenDate ?? this.batchOpenDate,
        batchImage: batchImage ?? this.batchImage,
        moduleName: moduleName ?? this.moduleName,
        moduleDesc: moduleDesc ?? this.moduleDesc,
        noOfSessions: noOfSessions ?? this.noOfSessions,
        completionTimeHrs: completionTimeHrs ?? this.completionTimeHrs,
      );

  factory StudyModuleModel.fromJson(Map<String, dynamic> json) =>
      StudyModuleModel(
        batchModuleId: json["batch_module_id"],
        batchId: json["batch_id"],
        moduleId: json["module_id"],
        isActive: json["is_active"],
        batchName: json["batch_name"],
        batchDesc: json["batch_desc"],
        batchOpenDate: json["batch_open_date"] == null
            ? null
            : DateTime.parse(json["batch_open_date"]),
        batchImage: json["batch_image"],
        moduleName: json["module_name"],
        moduleDesc: json["module_desc"],
        noOfSessions: json["no_of_sessions"],
        completionTimeHrs: json["completion_time_hrs"],
      );

  Map<String, dynamic> toJson() => {
        "batch_module_id": batchModuleId,
        "batch_id": batchId,
        "module_id": moduleId,
        "is_active": isActive,
        "batch_name": batchName,
        "batch_desc": batchDesc,
        "batch_open_date": batchOpenDate?.toIso8601String(),
        "batch_image": batchImage,
        "module_name": moduleName,
        "module_desc": moduleDesc,
        "no_of_sessions": noOfSessions,
        "completion_time_hrs": completionTimeHrs,
      };
}
