// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  final int? batchId;
  final String? batchName;
  final List<AttendanceRecord>? attendanceRecords;

  AttendanceModel({
    this.batchId,
    this.batchName,
    this.attendanceRecords,
  });

  AttendanceModel copyWith({
    int? batchId,
    String? batchName,
    List<AttendanceRecord>? attendanceRecords,
  }) =>
      AttendanceModel(
        batchId: batchId ?? this.batchId,
        batchName: batchName ?? this.batchName,
        attendanceRecords: attendanceRecords ?? this.attendanceRecords,
      );

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        attendanceRecords: json["attendance_records"] == null
            ? []
            : List<AttendanceRecord>.from(json["attendance_records"]!
                .map((x) => AttendanceRecord.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "batch_id": batchId,
        "batch_name": batchName,
        "attendance_records": attendanceRecords == null
            ? []
            : List<dynamic>.from(attendanceRecords!.map((x) => x.toJson())),
      };
}

class AttendanceRecord {
  final String? status;
  final DateTime? attendanceDate;
  final String? attendanceDay;

  AttendanceRecord({
    this.status,
    this.attendanceDate,
    this.attendanceDay,
  });

  AttendanceRecord copyWith({
    String? status,
    DateTime? attendanceDate,
    String? attendanceDay,
  }) =>
      AttendanceRecord(
        status: status ?? this.status,
        attendanceDate: attendanceDate ?? this.attendanceDate,
        attendanceDay: attendanceDay ?? this.attendanceDay,
      );

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
        status: json["status"],
        attendanceDate: json["attendance_date"] == null
            ? null
            : DateTime.parse(json["attendance_date"]),
        attendanceDay: json["attendance_day"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "attendance_date":
            "${attendanceDate!.year.toString().padLeft(4, '0')}-${attendanceDate!.month.toString().padLeft(2, '0')}-${attendanceDate!.day.toString().padLeft(2, '0')}",
        "attendance_day": attendanceDay,
      };
}
