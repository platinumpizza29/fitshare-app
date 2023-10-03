// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitshare/Components/new_workout_comp.dart';
import 'package:fitshare/Controllers/workout%20_controller.dart';
import 'package:fitshare/Pages/workout_details_page.dart';
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
            WorkoutController().getAllRoutines(context);
            if (providerStore
                .routineModel.routine.routine.exercises.isNotEmpty) {
              var routine1 = providerStore.routineModel.routine.routine;
              return FutureBuilder(
                future: WorkoutController().getAllRoutines(context),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: routine1.exercises.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(routine1.exercises[index].name),
                        subtitle: Text(routine1.category),
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => WorkoutDetailsPage(
                                name: routine1.exercises[index].name),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
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
                      onPressed: () => NewWorkoutComp().newWorkout(context),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
