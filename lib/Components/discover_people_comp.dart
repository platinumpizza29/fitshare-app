// ignore_for_file: prefer_const_constructors

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverPeopleComp extends StatelessWidget {
  const DiscoverPeopleComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStore>(
      builder: (context, providerStore, child) {
        return SizedBox(
          height: 90,
          width: double.infinity,
          child: FutureBuilder(
            future: UserController().handleHomePage(
              providerStore.userDetails.userDetails.username,
              context,
            ),
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
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homePageFeed!.feed.discoverPeople.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Text(
                            homePageFeed.feed.discoverPeople[index].username
                                .toString()
                                .substring(0, 2)
                                .toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
