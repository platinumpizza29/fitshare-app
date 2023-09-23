// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String token;
  UserDetails userDetails;

  UserModel({
    required this.token,
    required this.userDetails,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        userDetails: UserDetails.fromJson(json["user_details"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_details": userDetails.toJson(),
      };
}

class UserDetails {
  String name;
  String username;
  String email;
  String height;
  String weight;
  String age;
  String userType;

  UserDetails({
    required this.name,
    required this.username,
    required this.email,
    required this.height,
    required this.weight,
    required this.age,
    required this.userType,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "height": height,
        "weight": weight,
        "age": age,
        "user_type": userType,
      };
}
