// To parse this JSON data, do
//
//     final paymentPostModel = paymentPostModelFromJson(jsonString);

import 'dart:convert';

PaymentPostModel paymentPostModelFromJson(String str) =>
    PaymentPostModel.fromJson(json.decode(str));

String paymentPostModelToJson(PaymentPostModel data) =>
    json.encode(data.toJson());

class PaymentPostModel {
  final int? studentId;
  final int? paidAmount;
  final int? categoryId;
  final String? productId;
  final int? balanceAmount;
  final String? comments;
  final String? paymentMode;
  final int? paymentNumber;
  final String? transactionId;
  final String? utrNumbe;

  PaymentPostModel({
    this.paidAmount,
    this.studentId,
    this.categoryId,
    this.productId,
    this.balanceAmount,
    this.comments,
    this.paymentMode,
    this.paymentNumber,
    this.transactionId,
    this.utrNumbe,
  });

  PaymentPostModel copyWith({
    int? paidAmount,
    int? studentId,
    int? categoryId,
    String? productId,
    int? balanceAmount,
    String? comments,
    String? paymentMode,
    int? paymentNumber,
    String? transactionId,
    String? utrNumbe,
  }) =>
      PaymentPostModel(
        paidAmount: paidAmount ?? this.paidAmount,
        studentId: studentId ?? this.studentId,
        categoryId: categoryId ?? this.categoryId,
        productId: productId ?? this.productId,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        comments: comments ?? this.comments,
        paymentMode: paymentMode ?? this.paymentMode,
        paymentNumber: paymentNumber ?? this.paymentNumber,
        transactionId: transactionId ?? this.transactionId,
        utrNumbe: utrNumbe ?? this.utrNumbe,
      );

  factory PaymentPostModel.fromJson(Map<String, dynamic> json) =>
      PaymentPostModel(
        paidAmount: json["paid_amount"],
        studentId: json["student_id"],
        categoryId: json["category_id"],
        productId: json["product_id"],
        balanceAmount: json["balance_amount"],
        comments: json["comments"],
        paymentMode: json["payment_mode"],
        paymentNumber: json["payment_number"],
        transactionId: json["transaction_id"],
        utrNumbe: json["utr_numbe"],
      );

  Map<String, dynamic> toJson() => {
        "paid_amount": paidAmount,
        "student_id": studentId,
        "category_id": categoryId,
        "product_id": productId,
        "balance_amount": balanceAmount,
        "comments": comments,
        "payment_mode": paymentMode,
        "payment_number": paymentNumber,
        "transaction_id": transactionId,
        "utr_numbe": utrNumbe,
      };
}
