// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Pages/settings_page.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Consumer<ProviderStore>(
        builder: (context, providerStore, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Text(
                      providerStore.userDetails.userDetails.name
                          .toString()
                          .substring(0, 2)
                          .toUpperCase(),
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                CupertinoListSection(
                  header: Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text("Name"),
                      leading: Icon(Icons.lock_outline),
                      trailing: Text(providerStore.userDetails.userDetails.name
                          .toString()
                          .toUpperCase()),
                    ),
                    CupertinoListTile(
                      title: Text("Username"),
                      leading: Icon(Icons.person_outline),
                      trailing: Text(providerStore
                          .userDetails.userDetails.username
                          .toString()),
                    ),
                    CupertinoListTile(
                      title: Text("Email"),
                      trailing: Text(providerStore.userDetails.userDetails.email
                          .toString()),
                      leading: Icon(Icons.mail_outline),
                    ),
                  ],
                ),
                CupertinoListSection(
                  header: Text(
                    "More Options",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text("Info"),
                      leading: Icon(Icons.info_outline),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    CupertinoListTile(
                      title: Text("Help"),
                      leading: Icon(Icons.help_outline),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    CupertinoListTile(
                      title: Text("Terms and Conditions"),
                      leading: Icon(Icons.notes_outlined),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    CupertinoListTile(
                      onTap: () => UserController().handleLogout(),
                      title: Text("Logout"),
                      leading: Icon(Icons.logout),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
