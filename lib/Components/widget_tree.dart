import 'package:fitshare/Pages/home_page.dart';
import 'package:fitshare/Pages/login_page.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key});
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: handleWidgetTree(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or some other widget while waiting.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error case.
          return Text('Error: ${snapshot.error}');
        } else {
          // Return the LoginPage or HomePage based on the result of the Future.
          return snapshot.data ?? LoginPage();
        }
      },
    );
  }

  Future<Widget> handleWidgetTree(context) async {
    var authToken = await storage.read(key: "auth_token");
    if (authToken == null || authToken.isEmpty) {
      return LoginPage(); // Return the LoginPage widget
    } else {
      ProviderStore providerStore =
          Provider.of<ProviderStore>(context, listen: false);
      providerStore.handleUserDetailsfromStorage();
      return const HomePage();
    }
  }
}
