// To parse this JSON data, do
//
//     final featureModel = featureModelFromJson(jsonString);

import 'dart:convert';

FeatureModel featureModelFromJson(String str) =>
    FeatureModel.fromJson(json.decode(str));

String featureModelToJson(FeatureModel data) => json.encode(data.toJson());

class FeatureModel {
  final String? tag;
  final String? title;
  final String? description;
  final DateTime? scheduleTime;
  final String? thumbnail;
  final String? link;
  final String? icon;

  FeatureModel({
    this.tag,
    this.title,
    this.description,
    this.scheduleTime,
    this.thumbnail,
    this.link,
    this.icon,
  });

  FeatureModel copyWith({
    String? tag,
    String? title,
    String? description,
    DateTime? scheduleTime,
    String? thumbnail,
    String? link,
    String? icon,
  }) =>
      FeatureModel(
        tag: tag ?? this.tag,
        title: title ?? this.title,
        description: description ?? this.description,
        scheduleTime: scheduleTime ?? this.scheduleTime,
        thumbnail: thumbnail ?? this.thumbnail,
        link: link ?? this.link,
        icon: icon ?? icon,
      );

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
        tag: json["tag"],
        title: json["title"],
        description: json["description"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
        thumbnail: json["thumbnail"],
        link: json["link"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "title": title,
        "description": description,
        "schedule_time": scheduleTime?.toIso8601String(),
        "thumbnail": thumbnail,
        "link": link,
        "icon": icon,
      };
}
