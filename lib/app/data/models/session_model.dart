// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) =>
    SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  final int? sessionId;
  final String? sessionName;
  final String? sessionDesc;
  final String? thumbnail;
  final String? videoLink;
  final int? moduleId;
  final dynamic isPublished;
  final String? videoPublicId;
  final String? thumbnailPublicId;
  final int? videoDuration;
  final int? videoSize;
  final String? sessionLevel;
  final DateTime? scheduleTime;

  SessionModel({
    this.sessionId,
    this.sessionName,
    this.sessionDesc,
    this.thumbnail,
    this.videoLink,
    this.moduleId,
    this.isPublished,
    this.videoPublicId,
    this.thumbnailPublicId,
    this.videoDuration,
    this.videoSize,
    this.sessionLevel,
    this.scheduleTime,
  });

  SessionModel copyWith({
    int? sessionId,
    String? sessionName,
    String? sessionDesc,
    String? thumbnail,
    String? videoLink,
    int? moduleId,
    dynamic isPublished,
    String? videoPublicId,
    String? thumbnailPublicId,
    int? videoDuration,
    int? videoSize,
    String? sessionLevel,
    DateTime? scheduleTime,
  }) =>
      SessionModel(
        sessionId: sessionId ?? this.sessionId,
        sessionName: sessionName ?? this.sessionName,
        sessionDesc: sessionDesc ?? this.sessionDesc,
        thumbnail: thumbnail ?? this.thumbnail,
        videoLink: videoLink ?? this.videoLink,
        moduleId: moduleId ?? this.moduleId,
        isPublished: isPublished ?? this.isPublished,
        videoPublicId: videoPublicId ?? this.videoPublicId,
        thumbnailPublicId: thumbnailPublicId ?? this.thumbnailPublicId,
        videoDuration: videoDuration ?? this.videoDuration,
        videoSize: videoSize ?? this.videoSize,
        sessionLevel: sessionLevel ?? this.sessionLevel,
        scheduleTime: scheduleTime ?? this.scheduleTime,
      );

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        sessionId: json["session_id"],
        sessionName: json["session_name"],
        sessionDesc: json["session_desc"],
        thumbnail: json["thumbnail"],
        videoLink: json["video_link"],
        moduleId: json["module_id"],
        isPublished: json["isPublished"],
        videoPublicId: json["video_publicId"],
        thumbnailPublicId: json["thumbnail_publicId"],
        videoDuration: json["video_duration"],
        videoSize: json["video_size"],
        sessionLevel: json["session_level"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
      );

  Map<String, dynamic> toJson() => {
        "session_id": sessionId,
        "session_name": sessionName,
        "session_desc": sessionDesc,
        "thumbnail": thumbnail,
        "video_link": videoLink,
        "module_id": moduleId,
        "isPublished": isPublished,
        "video_publicId": videoPublicId,
        "thumbnail_publicId": thumbnailPublicId,
        "video_duration": videoDuration,
        "video_size": videoSize,
        "session_level": sessionLevel,
        "schedule_time":
            "${scheduleTime!.year.toString().padLeft(4, '0')}-${scheduleTime!.month.toString().padLeft(2, '0')}-${scheduleTime!.day.toString().padLeft(2, '0')}",
      };
}
