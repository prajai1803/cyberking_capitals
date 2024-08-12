// To parse this JSON data, do
//
//     final moduleSessionModel = moduleSessionModelFromJson(jsonString);

import 'dart:convert';

import 'feature_model.dart';

ModuleSessionModel moduleSessionModelFromJson(String str) =>
    ModuleSessionModel.fromJson(json.decode(str));

String moduleSessionModelToJson(ModuleSessionModel data) =>
    json.encode(data.toJson());

class ModuleSessionModel {
  final int? batchId;
  final String? batchName;
  final int? sessionCount;
  final int? duration;
  final IntroVideos? introVideos;
  final List<Module>? modules;
  final List<FeatureModel>? features;

  ModuleSessionModel({
    this.batchId,
    this.batchName,
    this.sessionCount,
    this.duration,
    this.introVideos,
    this.modules,
    this.features,
  });

  ModuleSessionModel copyWith({
    int? batchId,
    String? batchName,
    int? sessionCount,
    int? duration,
    IntroVideos? introVideos,
    List<Module>? modules,
    List<FeatureModel>? features,
  }) =>
      ModuleSessionModel(
        batchId: batchId ?? this.batchId,
        batchName: batchName ?? this.batchName,
        sessionCount: sessionCount ?? this.sessionCount,
        duration: duration ?? this.duration,
        introVideos: introVideos ?? this.introVideos,
        modules: modules ?? this.modules,
        features: features ?? this.features,
      );

  factory ModuleSessionModel.fromJson(Map<String, dynamic> json) =>
      ModuleSessionModel(
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        sessionCount: json["session_count"],
        duration: json["duration"],
        introVideos: json["intro_videos"] == null
            ? null
            : IntroVideos.fromJson(json["intro_videos"]),
        modules: json["modules"] == null
            ? []
            : List<Module>.from(
                json["modules"]!.map((x) => Module.fromJson(x))),
        features: json["modules"] == null
            ? []
            : List<FeatureModel>.from(
                json["features"]!.map((x) => FeatureModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "batch_id": batchId,
        "batch_name": batchName,
        "session_count": sessionCount,
        "duration": duration,
        "intro_videos": introVideos?.toJson(),
        "modules": modules == null
            ? []
            : List<dynamic>.from(modules!.map((x) => x.toJson())),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
      };
}

class IntroVideos {
  final int? videoId;
  final String? videoName;
  final String? videoLink;
  final String? thumbnail;
  final String? description;

  IntroVideos({
    this.videoId,
    this.videoName,
    this.videoLink,
    this.thumbnail,
    this.description,
  });

  IntroVideos copyWith({
    int? videoId,
    String? videoName,
    String? videoLink,
    String? thumbnail,
    String? description,
  }) =>
      IntroVideos(
        videoId: videoId ?? this.videoId,
        videoName: videoName ?? this.videoName,
        videoLink: videoLink ?? this.videoLink,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
      );

  factory IntroVideos.fromJson(Map<String, dynamic> json) => IntroVideos(
        videoId: json["video_id"],
        videoName: json["video_name"],
        videoLink: json["video_link"],
        thumbnail: json["thumbnail"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "video_name": videoName,
        "video_link": videoLink,
        "thumbnail": thumbnail,
        "description": description,
      };
}

class Module {
  final int? moduleId;
  final String? moduleName;
  final String? moduleDesc;
  final String? thumbnail;
  final List<Session>? sessions;
  final int? completionTimeHrs;
  final int? sessionCount;
  final String? productCategory;
  final String? discountPercentage;
  final int? discountAmount;
  final int? moduleFees;

  Module({
    this.moduleId,
    this.moduleName,
    this.moduleDesc,
    this.thumbnail,
    this.sessions,
    this.completionTimeHrs,
    this.sessionCount,
    this.productCategory,
    this.discountPercentage,
    this.discountAmount,
    this.moduleFees,
  });

  Module copyWith({
    int? moduleId,
    String? moduleName,
    String? moduleDesc,
    String? thumbnail,
    List<Session>? sessions,
    int? completionTimeHrs,
    int? sessionCount,
    String? productCategory,
    String? discountPercentage,
    int? discountAmount,
    int? moduleFees,
  }) =>
      Module(
        moduleId: moduleId ?? this.moduleId,
        moduleName: moduleName ?? this.moduleName,
        moduleDesc: moduleDesc ?? this.moduleDesc,
        thumbnail: thumbnail ?? this.thumbnail,
        sessions: sessions ?? this.sessions,
        completionTimeHrs: completionTimeHrs ?? this.completionTimeHrs,
        sessionCount: sessionCount ?? this.sessionCount,
        productCategory: productCategory ?? this.productCategory,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountAmount: discountAmount ?? this.discountAmount,
        moduleFees: moduleFees,
      );

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        moduleId: json["module_id"],
        moduleName: json["module_name"],
        moduleDesc: json["module_desc"],
        thumbnail: json["thumbnail"],
        sessions: json["sessions"] == null
            ? []
            : List<Session>.from(
                json["sessions"]!.map((x) => Session.fromJson(x))),
        completionTimeHrs: json["completion_time_hrs"],
        sessionCount: json["session_count"],
        productCategory: json["product_category"],
        discountPercentage: json["discount_percentage"],
        discountAmount: json["discount_amount"],
        moduleFees: json["module_fees"],
      );

  Map<String, dynamic> toJson() => {
        "module_id": moduleId,
        "module_name": moduleName,
        "module_desc": moduleDesc,
        "thumbnail": thumbnail,
        "sessions": sessions == null
            ? []
            : List<dynamic>.from(sessions!.map((x) => x.toJson())),
        "completion_time_hrs": completionTimeHrs,
        "session_count": sessionCount,
        "product_category": productCategory,
        "discount_percentage": discountPercentage,
        "discount_amount": discountAmount,
        "module_fees": moduleFees,
      };
}

class Session {
  final int? sessionId;
  final String? sessionName;
  final String? sessionDesc;
  final String? thumbnail;
  final String? videoLink;
  final int? videoDuration;

  Session({
    this.sessionId,
    this.sessionName,
    this.sessionDesc,
    this.thumbnail,
    this.videoLink,
    this.videoDuration,
  });

  Session copyWith({
    int? sessionId,
    String? sessionName,
    String? sessionDesc,
    String? thumbnail,
    String? videoLink,
    int? videoDuration,
  }) =>
      Session(
        sessionId: sessionId ?? this.sessionId,
        sessionName: sessionName ?? this.sessionName,
        sessionDesc: sessionDesc ?? this.sessionDesc,
        thumbnail: thumbnail ?? this.thumbnail,
        videoLink: videoLink ?? this.videoLink,
        videoDuration: videoDuration ?? this.videoDuration,
      );

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        sessionId: json["session_id"],
        sessionName: json["session_name"],
        sessionDesc: json["session_desc"],
        thumbnail: json["thumbnail"],
        videoLink: json["video_link"],
        videoDuration: json["video_duration"],
      );

  Map<String, dynamic> toJson() => {
        "session_id": sessionId,
        "session_name": sessionName,
        "session_desc": sessionDesc,
        "thumbnail": thumbnail,
        "video_link": videoLink,
        "video_duration": videoDuration,
      };
}
