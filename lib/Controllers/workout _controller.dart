import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitshare/Models/single_routine_model.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class WorkoutController {
  String url = "http://86.155.156.191:5000";

  Future<SingleRoutineModel> getAllRoutines(context) async {
    var response = await http.get(
      Uri.parse("$url/user/jaym/routine"),
    );
    var routine = singleRoutineModelFromJson(response.body);
    ProviderStore providerStore =
        Provider.of<ProviderStore>(context, listen: false);
    providerStore.handleSingleRoutine(routine);
    return routine;
  }

  Future<void> createNewRoutine(
      String username, String category, List<String> routine, context) async {
    Response response = await Dio().post('$url/user/$username/routine', data: {
      "username": username,
      "category": category,
      "exercises": routine
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.data,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Error while creating routine",
          ),
        ),
      );
    }
  }

//! to be implemented later
  Future<Map<String, dynamic>> renderExerciseList() async {
    String jsonString = await rootBundle.loadString('images/exercise.json');
    Map<String, dynamic> routinesData = json.decode(jsonString);
    return routinesData;
  }
}
