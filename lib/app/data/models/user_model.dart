// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int? id;
  final DateTime? createdAt;
  final String? name;
  final String? email;
  final int? emailVerified;
  final int? phoneNumberVerified;
  final String? mobileNumber;
  final String? whatsappNumber;
  final String? profilePhoto;
  final DateTime? dateOfBirth;
  final String? location;
  final String? password;
  final String? notificationToken;

  UserModel({
    this.id,
    this.createdAt,
    this.name,
    this.email,
    this.emailVerified,
    this.phoneNumberVerified,
    this.mobileNumber,
    this.whatsappNumber,
    this.dateOfBirth,
    this.location,
    this.profilePhoto,
    this.password,
    this.notificationToken,
  });

  UserModel copyWith({
    int? id,
    DateTime? createdAt,
    String? name,
    String? email,
    int? emailVerified,
    int? phoneNumberVerified,
    String? mobileNumber,
    String? whatsappNumber,
    DateTime? dateOfBirth,
    String? location,
    String? profilePhoto,
    String? password,
    String? notificationToken,
  }) =>
      UserModel(
          id: id ?? this.id,
          createdAt: createdAt ?? this.createdAt,
          name: name ?? this.name,
          email: email ?? this.email,
          emailVerified: emailVerified ?? this.emailVerified,
          phoneNumberVerified: phoneNumberVerified ?? this.phoneNumberVerified,
          mobileNumber: mobileNumber ?? this.mobileNumber,
          whatsappNumber: whatsappNumber ?? this.whatsappNumber,
          profilePhoto: profilePhoto ?? this.profilePhoto,
          dateOfBirth: dateOfBirth ?? this.dateOfBirth,
          location: location ?? this.location,
          password: password ?? this.password,
          notificationToken: notificationToken ?? this.notificationToken);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"],
        email: json["email"],
        emailVerified: json["email_verification"],
        phoneNumberVerified: json["phone_number_verified"],
        mobileNumber: json["mobile_number"],
        whatsappNumber: json["whatsapp_number"],
        profilePhoto: json["profile_photo"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        location: json["location"],
        password: json["password"],
        notificationToken: json["notificationToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
        "email": email,
        "email_verification": emailVerified,
        "phone_number_verified": phoneNumberVerified,
        "mobile_number": mobileNumber,
        "whatsapp_number": whatsappNumber,
        "profile_photo": profilePhoto,
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "location": location,
        "password": password,
        "notification_token": notificationToken,
      };
}
