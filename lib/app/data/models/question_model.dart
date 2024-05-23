// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  final int? questionId;
  final String? question;
  final List<String>? options;
  final int? answer;

  QuestionModel({
    this.questionId,
    this.question,
    this.options,
    this.answer,
  });

  QuestionModel copyWith({
    int? questionId,
    String? question,
    List<String>? options,
    int? answer,
  }) =>
      QuestionModel(
        questionId: questionId ?? this.questionId,
        question: question ?? this.question,
        options: options ?? this.options,
        answer: answer ?? this.answer,
      );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questionId: json["question_id"],
        question: json["question"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question": question,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "answer": answer,
      };
}
