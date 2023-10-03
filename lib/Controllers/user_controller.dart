import 'dart:convert';
import 'package:fitshare/Models/user_model.dart';
import 'package:fitshare/Pages/home_page.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:fitshare/Models/home_page_model.dart';
import 'package:fitshare/Pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class UserController {
  final storage = const FlutterSecureStorage();
  var url = "http://86.155.156.191:5000";

  Future<void> handleUserLogin(String email, String password, context) async {
    ProviderStore providerStore =
        Provider.of<ProviderStore>(context, listen: false);
    try {
      var response = await Dio().post("http://86.155.156.191:5000/login",
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        final userEncode = json.encode(response.data);
        final data = userModelFromJson(userEncode);
        storage.write(key: 'auth_token', value: data.token);

        //initalise the userDetails in provider
        providerStore.handleUserDetailsfromLogin(data);

        //encoding user to store in local storage
        var encodedUser = jsonEncode(data.userDetails);
        storage.write(key: 'user_details', value: encodedUser);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error while logging in"),
          ),
        );
      }
    } on Exception catch (e) {
      print(e);
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
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {}
    } catch (e) {}
  }

  Future<HomePageModel> handleHomePage(String userName, context) async {
    var response = await http.get(Uri.parse("$url/user/$userName/homepage"));
    if (response.statusCode == 200) {
      return homePageModelFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // * handle user logout
  void handleLogout() async {
    await storage.delete(key: 'auth_token');
    await storage.delete(key: 'user_details');
  }
}
