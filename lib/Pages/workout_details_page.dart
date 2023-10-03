// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Ionicons.text_outline),
              ),
              Tab(
                icon: Icon(Ionicons.film_outline),
              )
            ],
          ),
          title: Text(name),
        ),
        body: TabBarView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Every detail of this particular exercise \n even analytics of the exercise should be listed here",
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Center(
                child: Text(
                  "reel loop of this exercise should be here",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
