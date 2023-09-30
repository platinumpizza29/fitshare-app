// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:fitshare/Models/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProviderStore with ChangeNotifier {
  bool _isDarkMode = false;
  int _currentIndexBottomNav = 0;
  List _myWorkouts = [];
  int _stepperIndex = 0;
  String _greeting = "Good Afternoon!";
  late Map<String, dynamic> _userDetails;

  bool get isDarkMode => _isDarkMode;
  int get currentIndexBottomNav => _currentIndexBottomNav;
  List get myWorkouts => _myWorkouts;
  int get stepperIndex => _stepperIndex;
  String get greeting => _greeting;
  Map<String, dynamic> get userDetails => _userDetails;

  handleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  handleNavChange(int value) {
    _currentIndexBottomNav = value;
    notifyListeners();
  }

  handleAddNewWorkout(workout) {
    _myWorkouts.add(workout);
    notifyListeners();
  }

  handleIncrementStepper(int value) {
    _stepperIndex++;
    notifyListeners();
  }

  handleDecrementStepper(int value) {
    _stepperIndex -= value;
    notifyListeners();
  }

  handleTappedStepper(int value) {
    _stepperIndex = value;
    notifyListeners();
  }

  handleUserDetails() async {
    var storage = const FlutterSecureStorage();
    final String? decodedUser = await storage.read(key: 'user_details');
    _userDetails = jsonDecode(decodedUser!);
  }

  handleGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      var greeting = "Good Morning";
      _greeting = greeting;
      notifyListeners();
    } else if (hour >= 12 && hour < 17) {
      var greeting = "Good Afternoon!";
      _greeting = greeting;
      notifyListeners();
    } else {
      var greeting = "Good Evening!";
      _greeting = greeting;
      notifyListeners();
    }
  }
}
