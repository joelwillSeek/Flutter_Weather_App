import 'package:flutter/material.dart';
import 'package:flutter_weather_app/MainApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: getAppBar(),
          body: const MainApp(),
        ));
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Weather"),
        Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const Icon(Icons.sunny))
      ]),
    );
  }
}
