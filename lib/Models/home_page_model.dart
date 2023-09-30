// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  Feed feed;

  HomePageModel({
    required this.feed,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        feed: Feed.fromJson(json["feed"]),
      );

  Map<String, dynamic> toJson() => {
        "feed": feed.toJson(),
      };
}

class Feed {
  String userName;
  List<DiscoverPerson> discoverPeople;
  List<TodaysEvent> todaysEvent;
  dynamic todaysExercise;

  Feed({
    required this.userName,
    required this.discoverPeople,
    required this.todaysEvent,
    required this.todaysExercise,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        userName: json["user_name"],
        discoverPeople: List<DiscoverPerson>.from(
            json["discover_people"].map((x) => DiscoverPerson.fromJson(x))),
        todaysEvent: List<TodaysEvent>.from(
            json["todays_event"].map((x) => TodaysEvent.fromJson(x))),
        todaysExercise: json["todays_exercise"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "discover_people":
            List<dynamic>.from(discoverPeople.map((x) => x.toJson())),
        "todays_event": List<dynamic>.from(todaysEvent.map((x) => x.toJson())),
        "todays_exercise": todaysExercise,
      };
}

class DiscoverPerson {
  String username;
  String profileImageLink;

  DiscoverPerson({
    required this.username,
    required this.profileImageLink,
  });

  factory DiscoverPerson.fromJson(Map<String, dynamic> json) => DiscoverPerson(
        username: json["username"],
        profileImageLink: json["profile_image_link"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profile_image_link": profileImageLink,
      };
}

class TodaysEvent {
  String eventName;
  DateTime eventTime;

  TodaysEvent({
    required this.eventName,
    required this.eventTime,
  });

  factory TodaysEvent.fromJson(Map<String, dynamic> json) => TodaysEvent(
        eventName: json["event_name"],
        eventTime: DateTime.parse(json["event_time"]),
      );

  Map<String, dynamic> toJson() => {
        "event_name": eventName,
        "event_time": eventTime.toIso8601String(),
      };
}
