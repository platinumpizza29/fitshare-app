// ignore_for_file: prefer_const_constructors

import 'package:fitshare/Controllers/user_controller.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class EventsComp extends StatelessWidget {
  const EventsComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStore>(
      builder: (context, providerStore, child) {
        return SizedBox(
          height: 200,
          width: double.infinity,
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
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: homePageFeed!.feed.todaysEvent.length,
                itemBuilder: (context, index) {
                  var data = homePageFeed.feed.todaysEvent[index];
                  String isoDate = data.eventTime.toIso8601String();
                  String convertedDate = convertIsoToFormattedDate(isoDate);
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CupertinoColors.secondarySystemFill,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10.0),
                          title: Text(
                            data.eventName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(convertedDate),
                          trailing: Icon(Ionicons.arrow_forward_outline),
                        ),
                      ),
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

  String convertIsoToFormattedDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    var formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return formattedDate;
  }
}
