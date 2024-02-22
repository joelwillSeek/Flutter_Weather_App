import 'package:flutter/material.dart';
import 'package:flutter_weather_app/SearchAndFilter.dart';
import 'package:http/http.dart' as http;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String uri =
      "http://api.weatherapi.com/v1/current.json?key=f6aedda0032042e1812150300231109&q=London&aqi=no";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchAndFilter(),
        Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "Addis Ababa",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "30.0\u2103",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Icon(
                  Icons.sunny,
                  color: Colors.orange,
                  size: 100.0,
                ))
          ],
        ))
      ],
    );
  }

  Future<Map> getCityInfo() {
    Uri uriAbstraction = Uri.parse(uri);
    Uri edited = uriAbstraction.replace(query: "Addis Ababa");
    Future<http.Response> getResponse= http.get(edited);

    Map<String,String> cityInfo=["name":getResponse];

    return cityInfo;
  }
}

/*
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
*/