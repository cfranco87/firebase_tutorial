import 'package:flutter/material.dart';
import 'package:yellow_pages/app_config.dart';
import 'package:yellow_pages/providers/providers.dart'; //import all provider files
import 'package:provider/provider.dart';
//import all screen files

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove banner
      initialRoute: AppConfig.initialRoute,
      routes: AppConfig.route(), //takes routes from class AppConfig
    ); // Multi provider for routes/pages
  }
}
