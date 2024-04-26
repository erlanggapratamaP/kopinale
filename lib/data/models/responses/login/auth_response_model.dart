import 'dart:convert';

import 'user.dart';

class AuthResponseModel {
  String? accessToken;
  User? user;

  AuthResponseModel({this.accessToken, this.user});

  @override
  String toString() {
    return 'LoginResponseModel(accessToken: $accessToken, user: $user)';
  }

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));
  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        accessToken: json["access_token"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user?.toMap(),
      };

  AuthResponseModel copyWith({
    String? accessToken,
    User? user,
  }) {
    return AuthResponseModel(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }
}
