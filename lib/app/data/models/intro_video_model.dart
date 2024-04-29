// To parse this JSON data, do
//
//     final introVideoModel = introVideoModelFromJson(jsonString);

import 'dart:convert';

IntroVideoModel introVideoModelFromJson(String str) =>
    IntroVideoModel.fromJson(json.decode(str));

String introVideoModelToJson(IntroVideoModel data) =>
    json.encode(data.toJson());

class IntroVideoModel {
  final int? videoId;
  final DateTime? createdAt;
  final String? name;
  final String? link;
  final String? thumbnail;
  final String? description;
  final String? tag;
  final String? batchLevel;
  final int? isPublished;
  final int? lengthSeconds;
  final int? videoSizeMb;

  IntroVideoModel({
    this.videoId,
    this.createdAt,
    this.name,
    this.link,
    this.thumbnail,
    this.description,
    this.tag,
    this.batchLevel,
    this.isPublished,
    this.lengthSeconds,
    this.videoSizeMb,
  });

  IntroVideoModel copyWith({
    int? videoId,
    DateTime? createdAt,
    String? name,
    String? link,
    String? thumbnail,
    String? description,
    String? tag,
    String? batchLevel,
    int? isPublished,
    int? lengthSeconds,
    int? videoSizeMb,
  }) =>
      IntroVideoModel(
        videoId: videoId ?? this.videoId,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        link: link ?? this.link,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
        tag: tag ?? this.tag,
        batchLevel: batchLevel ?? this.batchLevel,
        isPublished: isPublished ?? this.isPublished,
        lengthSeconds: lengthSeconds ?? this.lengthSeconds,
        videoSizeMb: videoSizeMb ?? this.videoSizeMb,
      );

  factory IntroVideoModel.fromJson(Map<String, dynamic> json) =>
      IntroVideoModel(
        videoId: json["video_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"],
        link: json["link"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        tag: json["tag"],
        batchLevel: json["batch_level"],
        isPublished: json["isPublished"],
        lengthSeconds: json["length_seconds"],
        videoSizeMb: json["video_size_mb"],
      );

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
        "link": link,
        "thumbnail": thumbnail,
        "description": description,
        "tag": tag,
        "batch_level": batchLevel,
        "isPublished": isPublished,
        "length_seconds": lengthSeconds,
        "video_size_mb": videoSizeMb,
      };
}
