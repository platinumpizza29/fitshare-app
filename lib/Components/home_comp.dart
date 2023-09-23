// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:fitshare/Components/drawer_comp.dart";
import "package:fitshare/Pages/profile_page.dart";
import "package:fitshare/Providers/provider_store.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomeComp extends StatelessWidget {
  const HomeComp({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderStore providerStore1 =
        Provider.of<ProviderStore>(context, listen: false);
    providerStore1.handleUserDetails();
    // providerStore1.handleGreeting();
    return Scaffold(
        drawer: DrawerComp(),
        body: Consumer<ProviderStore>(
          builder: (context, providerStore, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    iconTheme: IconThemeData(color: Colors.black),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        //! user image should be present or initials
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 25,
                            child: Text(providerStore.userDetails['name']
                                .toString()
                                .substring(0, 2)
                                .toUpperCase()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ! this is to be changed according to the username
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ListTile(
                        title: Text(
                          "Hello " + providerStore.userDetails['name'],
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // ! this needs to change according to time
                        subtitle: Text(
                          providerStore.greeting,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: Text("Person 1"),
                      ),
                      CircleAvatar(
                        radius: 35,
                        child: Text("Person 2"),
                      ),
                      CircleAvatar(
                        radius: 35,
                        child: Text("Person 3"),
                      ),
                      CircleAvatar(
                        radius: 35,
                        child: Text("Person 4"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Events"),
                    trailing: CupertinoButton(
                      child: Text("Explore"),
                      onPressed: () {},
                    ),
                  ),
                  // ! Implement a listView builder with the list tile to render the events
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 230,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.red.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 230,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 230,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Todays Workout"),
                    trailing: CupertinoButton(
                      child: Text("View All"),
                      onPressed: () {},
                    ),
                  ),
                  // ! listview to be rendered here max count 3
                  ListTile(
                    title: Text("Workout 1"),
                  ),
                  ListTile(
                    title: Text("Workout 2"),
                  ),
                  ListTile(
                    title: Text("Workout 3"),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
