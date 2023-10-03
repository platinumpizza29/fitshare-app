import 'package:fitshare/Components/custom_theme.dart';
import 'package:fitshare/Components/widget_tree.dart';
import 'package:fitshare/Providers/provider_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderStore(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderStore>(
      builder: (context, providerStore, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: providerStore.isDarkMode
              ? CustomTheme.darkTheme
              : CustomTheme.lightTheme,
          home: const WidgetTree(),
        );
      },
    );
  }
}
