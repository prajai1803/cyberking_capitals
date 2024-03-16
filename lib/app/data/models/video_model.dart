import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  final String? videoId;
  final String? title;
  final String? description;
  final String? videoUrl;
  final int? session;
  final String? duration;

  VideoModel({
    this.videoId,
    this.title,
    this.description,
    this.videoUrl,
    this.session,
    this.duration,
  });

  VideoModel copyWith({
    String? videoId,
    String? title,
    String? description,
    String? videoUrl,
    int? session,
    String? duration,
  }) =>
      VideoModel(
        videoId: videoId ?? this.videoId,
        title: title ?? this.title,
        description: description ?? this.description,
        videoUrl: videoUrl ?? this.videoUrl,
        session: session ?? this.session,
        duration: duration ?? this.duration,
      );

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        videoId: json["videoId"],
        title: json["title"],
        description: json["description"],
        videoUrl: json["videoUrl"],
        session: json["session"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "title": title,
        "description": description,
        "videoUrl": videoUrl,
        "session": session,
        "duration": duration,
      };
}
