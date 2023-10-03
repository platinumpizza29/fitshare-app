import 'package:fitshare/Controllers/workout%20_controller.dart';
import 'package:flutter/material.dart';

class SelectExercises extends StatelessWidget {
  const SelectExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Exercises"),
      ),
      body: FutureBuilder(
        future: WorkoutController().renderExerciseList(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!['routines'].length,
            itemBuilder: (context, index) {
              return CheckboxListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: Text(
                  snapshot.data!['routines'][index]['category'].toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
