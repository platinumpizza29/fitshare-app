// ignore_for_file: prefer_const_constructors

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodaysWorkoutComp extends StatelessWidget {
  const TodaysWorkoutComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStore>(
      builder: (context, providerStore, child) {
        return SizedBox(
          child: FutureBuilder(
            future: UserController()
                .handleHomePage(providerStore.userDetails['username'], context),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("No Users Yet"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              var homePageFeed = snapshot.data;
              return ListTile(
                title: Text(
                  homePageFeed!.feed.todaysExercise == null
                      ? "No Exercises yet"
                      : homePageFeed!.feed.todaysExercise.toString(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
