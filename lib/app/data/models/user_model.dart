// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? userId;
  final String? email;
  final String? fullName;
  final String? contactNumber;
  final String? whatsappNumber;
  final bool? emailVerified;
  final bool? contactNumberVerified;
  final bool? whatsappNumberVerified;
  final String? userType;
  final dynamic location;

  UserModel({
    this.userId,
    this.email,
    this.fullName,
    this.contactNumber,
    this.whatsappNumber,
    this.emailVerified,
    this.contactNumberVerified,
    this.whatsappNumberVerified,
    this.userType,
    this.location,
  });

  UserModel copyWith({
    String? userId,
    String? email,
    String? fullName,
    String? contactNumber,
    String? whatsappNumber,
    bool? emailVerified,
    bool? contactNumberVerified,
    bool? whatsappNumberVerified,
    String? userType,
    dynamic location,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        contactNumber: contactNumber ?? this.contactNumber,
        whatsappNumber: whatsappNumber ?? this.whatsappNumber,
        emailVerified: emailVerified ?? this.emailVerified,
        contactNumberVerified:
            contactNumberVerified ?? this.contactNumberVerified,
        whatsappNumberVerified:
            whatsappNumberVerified ?? this.whatsappNumberVerified,
        userType: userType ?? this.userType,
        location: location ?? this.location,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        email: json["email"],
        fullName: json["full_name"],
        contactNumber: json["contact_number"],
        whatsappNumber: json["whatsapp_number"],
        emailVerified: json["email_verified"],
        contactNumberVerified: json["contact_number_verified"],
        whatsappNumberVerified: json["whatsapp_number_verified"],
        userType: json["user_type"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "full_name": fullName,
        "contact_number": contactNumber,
        "whatsapp_number": whatsappNumber,
        "email_verified": emailVerified,
        "contact_number_verified": contactNumberVerified,
        "whatsapp_number_verified": whatsappNumberVerified,
        "user_type": userType,
        "location": location,
      };
}
