// To parse this JSON data, do
//
//     final certificateModel = certificateModelFromJson(jsonString);

import 'dart:convert';

CertificateModel certificateModelFromJson(String str) =>
    CertificateModel.fromJson(json.decode(str));

String certificateModelToJson(CertificateModel data) =>
    json.encode(data.toJson());

class CertificateModel {
  final int? id;
  final int? studentId;
  final int? moduleId;
  final String? moduleName;
  final DateTime? createdAt;
  final dynamic createdBy;
  final int? isActive;
  final String? studentName;
  final int? quizScore;
  final int? batchId;

  CertificateModel({
    this.id,
    this.studentId,
    this.moduleId,
    this.moduleName,
    this.createdAt,
    this.createdBy,
    this.isActive,
    this.studentName,
    this.quizScore,
    this.batchId,
  });

  CertificateModel copyWith({
    int? id,
    int? studentId,
    int? moduleId,
    String? moduleName,
    DateTime? createdAt,
    dynamic createdBy,
    int? isActive,
    String? studentName,
    int? quizScore,
    int? batchId,
  }) =>
      CertificateModel(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        moduleId: moduleId ?? this.moduleId,
        moduleName: moduleName ?? this.moduleName,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        isActive: isActive ?? this.isActive,
        studentName: studentName ?? this.studentName,
        quizScore: quizScore ?? this.quizScore,
        batchId: batchId ?? this.batchId,
      );

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        id: json["id"],
        studentId: json["student_id"],
        moduleId: json["module_id"],
        moduleName: json["module_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        isActive: json["is_active"],
        studentName: json["student_name"],
        quizScore: json["quiz_score"],
        batchId: json["batch_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "module_id": moduleId,
        "module_name": moduleName,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "is_active": isActive,
        "student_name": studentName,
        "quiz_score": quizScore,
        "batch_id": batchId,
      };
}
