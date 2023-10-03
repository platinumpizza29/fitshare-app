// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitshare/Components/home_comp.dart';
import 'package:fitshare/Components/workout_comp.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStore>(
      builder: (context, providerStore, child) {
        return Scaffold(
          body: <Widget>[
            HomeComp(),
            WorkoutComp(),
            Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text('Page 2'),
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Page 3'),
            ),
          ][providerStore.currentIndexBottomNav],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: providerStore.currentIndexBottomNav,
            onTap: (value) {
              providerStore.handleNavChange(value);
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(Ionicons.home),
                title: Text("Home"),
              ),
              SalomonBottomBarItem(
                icon: Icon(Ionicons.barbell),
                title: Text("Workout"),
              ),
              SalomonBottomBarItem(
                icon: Icon(Ionicons.add_circle_outline),
                title: Text("New Reel"),
              ),
              SalomonBottomBarItem(
                icon: Icon(Ionicons.fast_food_outline),
                title: Text("Diet"),
              ),
            ],
          ),
        );
      },
    );
  }
}
