// ignore_for_file: prefer_const_constructors

import 'package:fitshare/Pages/select_exercises.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewWorkoutComp {
  Future<void> newWorkout(context) async {
    TextEditingController nameController = TextEditingController();
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Title(
                  color: Colors.black,
                  child: const Text(
                    "Add New Workout",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Routine Name",
                    hintText: "Legs",
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Select Category",
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton<String>(
                      value: list.first,
                      items: list
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ],
                ),
                ListTile(
                  title: Text("Select Exercises"),
                  subtitle: Text("zero selected"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SelectExercises(),
                    ),
                  ),
                ),
                CupertinoButton.filled(
                  child: Text("Add New Routine"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
