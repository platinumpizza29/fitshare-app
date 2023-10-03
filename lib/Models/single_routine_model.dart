// To parse this JSON data, do
//
//     final singleRoutineModel = singleRoutineModelFromJson(jsonString);

import 'dart:convert';

SingleRoutineModel singleRoutineModelFromJson(String str) =>
    SingleRoutineModel.fromJson(json.decode(str));

String singleRoutineModelToJson(SingleRoutineModel data) =>
    json.encode(data.toJson());

class SingleRoutineModel {
  SingleRoutineModelRoutine routine;

  SingleRoutineModel({
    required this.routine,
  });

  factory SingleRoutineModel.fromJson(Map<String, dynamic> json) =>
      SingleRoutineModel(
        routine: SingleRoutineModelRoutine.fromJson(json["routine"]),
      );

  Map<String, dynamic> toJson() => {
        "routine": routine.toJson(),
      };
}

class SingleRoutineModelRoutine {
  String username;
  RoutineRoutine routine;

  SingleRoutineModelRoutine({
    required this.username,
    required this.routine,
  });

  factory SingleRoutineModelRoutine.fromJson(Map<String, dynamic> json) =>
      SingleRoutineModelRoutine(
        username: json["username"],
        routine: RoutineRoutine.fromJson(json["routine"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "routine": routine.toJson(),
      };
}

class RoutineRoutine {
  String category;
  List<Exercise> exercises;

  RoutineRoutine({
    required this.category,
    required this.exercises,
  });

  factory RoutineRoutine.fromJson(Map<String, dynamic> json) => RoutineRoutine(
        category: json["category"],
        exercises: List<Exercise>.from(
            json["exercises"].map((x) => Exercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
      };
}

class Exercise {
  String name;
  dynamic sets;

  Exercise({
    required this.name,
    required this.sets,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        name: json["name"],
        sets: json["sets"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sets": sets,
      };
}
