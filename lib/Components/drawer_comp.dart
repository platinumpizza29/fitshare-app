// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerComp extends StatelessWidget {
  const DrawerComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              "My Routines",
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              "My Diet",
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            title: Text(
              "My Profile",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
