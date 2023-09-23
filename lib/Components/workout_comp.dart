// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitshare/Components/new_workout_comp.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class WorkoutComp extends StatelessWidget {
  const WorkoutComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("My Workouts"),
          actions: [
            IconButton(
              onPressed: () => NewWorkoutComp().newWorkout(context),
              icon: Icon(Ionicons.add_circle_outline),
            ),
          ],
        ),
        body: Consumer<ProviderStore>(
          builder: (context, providerStore, child) {
            if (providerStore.myWorkouts.isNotEmpty) {
              return Text("List View to rendered here");
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("No workouts added..."),
                  ),
                  Center(
                    child: CupertinoButton.filled(
                      child: Text("Add Workouts"),
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
