// To parse this JSON data, do
//
//     final featureVideoModel = featureVideoModelFromJson(jsonString);

import 'dart:convert';

FeatureVideoModel featureVideoModelFromJson(String str) =>
    FeatureVideoModel.fromJson(json.decode(str));

String featureVideoModelToJson(FeatureVideoModel data) =>
    json.encode(data.toJson());

class FeatureVideoModel {
  final String? id;
  final String? thumbnail;
  final String? url;
  final String? title;
  final String? description;
  final String? dateTime;
  final String? tagLable;

  FeatureVideoModel({
    this.id,
    this.thumbnail,
    this.url,
    this.title,
    this.description,
    this.dateTime,
    this.tagLable,
  });

  FeatureVideoModel copyWith({
    String? id,
    String? thumbnail,
    String? url,
    String? title,
    String? description,
    String? dateTime,
    String? tagLable,
  }) =>
      FeatureVideoModel(
        id: id ?? this.id,
        thumbnail: thumbnail ?? this.thumbnail,
        url: url ?? this.url,
        title: title ?? this.title,
        description: description ?? this.description,
        dateTime: dateTime ?? this.dateTime,
        tagLable: tagLable ?? this.tagLable,
      );

  factory FeatureVideoModel.fromJson(Map<String, dynamic> json) =>
      FeatureVideoModel(
        id: json["id"],
        thumbnail: json["thumbnail"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"],
        tagLable: json["tagLable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "url": url,
        "title": title,
        "description": description,
        "dateTime": dateTime,
        "tagLable": tagLable,
      };
}
