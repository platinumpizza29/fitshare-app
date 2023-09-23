// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<ProviderStore>(
        builder: (context, providerStore, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  title: Text("Language"),
                ),
                ListTile(
                  title: Text("DarkMode"),
                  trailing: CupertinoSwitch(
                    value: providerStore.isDarkMode,
                    onChanged: (value) => {
                      providerStore.handleDarkMode(value),
                    },
                  ),
                ),
                ListTile(
                  title: Text("DarkMode"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
