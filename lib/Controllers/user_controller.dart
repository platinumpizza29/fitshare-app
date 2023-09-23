import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitshare/Pages/home_page.dart';
import 'package:fitshare/Pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserController {
  final storage = const FlutterSecureStorage();
  var url = "http://86.155.156.191:5000";

  void handleUserLogin(String email, String password, context) async {
    try {
      var response = await Dio().post(
        "$url/login",
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        storage.write(key: 'auth_token', value: response.data['token']);
        var userDetails = jsonEncode(response.data["user_details"]);
        //! when you want to retrive the user decode first, after that user like this Eg: user['email]
        storage.write(key: 'user_details', value: userDetails);
        // Navigate to HomePage only if login is successful
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: CupertinoColors.systemRed,
            content: Text("Invalid Email or Password"),
          ),
        );
      }
    } catch (e) {
      // Handle Dio or network-related errors here
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Network error occurred"),
        ),
      );
    }
  }

  // * register user
  void handleUserRegistration(
      String name,
      String username,
      String email,
      String password,
      String age,
      String height,
      String weight,
      String userType,
      context) async {
    try {
      Response response = await Dio().post("$url/signup", data: {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "height": height,
        "weight": weight,
        "age": age,
        "user_type": userType
      });
      if (response.statusCode == 200) {
        print(response.data);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {}
    } catch (e) {
      print(e);
    }
  }

  // * handle user logout
  void handleLogout() async {
    await storage.delete(key: 'auth_token');
    await storage.delete(key: 'user_details');
  }
}
