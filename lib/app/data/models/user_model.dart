// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? uid;
  final String? displayName;
  final String? email;
  final String? gender;
  final String? phoneNumber;
  final String? photoUrl;
  final String? dateOfBirth;
  final bool? emailVerified;

  UserModel({
    this.uid,
    this.displayName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.photoUrl,
    this.dateOfBirth,
    this.emailVerified,
  });

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? gender,
    String? phoneNumber,
    String? photoUrl,
    String? dateOfBirth,
    bool? emailVerified,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoUrl: photoUrl ?? this.photoUrl,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoUrl"],
        dateOfBirth: json["dateOfBirth"],
        emailVerified: json["emailVerified"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "email": email,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "photoUrl": photoUrl,
        "dateOfBirth": dateOfBirth,
        "emailVerified": emailVerified,
      };
}
