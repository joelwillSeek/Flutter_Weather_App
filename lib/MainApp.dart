import 'package:flutter/material.dart';
import 'package:flutter_weather_app/SearchAndFilter.dart';
import 'package:flutter_weather_app/weather_api.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String query = "Addis Ababa";

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchAndFilter(
          textEditingController: textEditingController,
          searchClicked: searchClicked,
        ),
        FutureBuilder(future: getResponse(query), builder: buildTheCard)
      ],
    );
  }

  Widget buildTheCard(BuildContext context, AsyncSnapshot<CityInfo?> snapshot) {
    return Card(
      child: Row(children: [
        Column(
          children: [
            Text(snapshot.data?.cityName ?? "hi"),
            Text(snapshot.data?.temperature ?? "hot")
          ],
        ),
        changeIcon(snapshot.data?.weatherCondition),
      ]),
    );
  }

  Widget changeIcon(String? weatherCondition) {
    switch (weatherCondition) {
      default:
        return const Icon(Icons.sunny);
    }
  }

  void searchClicked() {
    String getQuery = textEditingController.text;
    setState(() {
      query = getQuery;
    });
  }
}
