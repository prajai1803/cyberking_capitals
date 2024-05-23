// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  final String? question;
  final List<String>? options;
  final int? answer;

  QuizModel({
    this.question,
    this.options,
    this.answer,
  });

  QuizModel copyWith({
    String? question,
    List<String>? options,
    int? answer,
  }) =>
      QuizModel(
        question: question ?? this.question,
        options: options ?? this.options,
        answer: answer ?? this.answer,
      );

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        question: json["question"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "answer": answer,
      };
}
