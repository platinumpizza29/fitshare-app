import 'package:flutter/material.dart';

class NewWorkoutComp {
  Future<void> newWorkout(context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Title(
                color: Colors.black,
                child: const Text("Add New Workout"),
              ),
            ],
          ),
        );
      },
    );
  }
}
