import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/SearchAndFilter.dart';
import 'package:flutter_weather_app/weather_api.dart';
import "package:http/http.dart" as http;

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
        Container(
          alignment: Alignment.center,
          child:
              FutureBuilder(future: getResponse(query), builder: buildTheCard),
        )
      ],
    );
  }

  Future<CityInfo?> getResponse(String query) async {
    const String apiKey = "f6aedda0032042e1812150300231109";

    var uri = Uri.http("api.weatherapi.com", "/v1/current.json", {"q": query});

    final response = await http.get(uri, headers: {"key": apiKey});

    if (context.mounted && Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      String cityName = responseJson["location"]["name"].toString();
      String temperature =
          "${responseJson["current"]["temp_c"]}\u2103".toString();
      String weatherIcon =
          responseJson["current"]["condition"]["icon"].toString();
      String weatherCondition =
          responseJson["current"]["condition"]["text"].toString();
      String windSpeedInKph = responseJson["current"]["wind_kph"].toString();
      String humidity = responseJson["current"]["humidity"].toString();

      return CityInfo(cityName, temperature, weatherIcon, weatherCondition,
          windSpeedInKph, humidity);
    } else {
      if (kDebugMode) {
        print("my data: ${response.statusCode}");
      }
    }

    return null;
  }

  Widget buildTheCard(BuildContext context, AsyncSnapshot<CityInfo?> snapshot) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Text(snapshot.data?.cityName ?? "no Data"),
            Text(snapshot.data?.temperature ?? "no Data"),
            Text(snapshot.data?.weatherCondition ?? "no Data"),
            Text(snapshot.data?.windSpeedInKph ?? "no Data"),
            Text(snapshot.data?.humidity ?? "no Data")
          ],
        ),
        if (snapshot.data?.icon != null)
          Image.network(snapshot.data!.icon ?? "")
        else
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: SvgPicture.asset(
              "assets/help.svg",
              width: 50,
            ),
          )
      ]),
    );
  }

  void searchClicked() {
    showDialog(context: context, builder: makeDialog);
    String getQuery = textEditingController.text;
    setState(() {
      query = getQuery;
    });
  }

  Widget makeDialog(BuildContext context) {
    return const SimpleDialog(
      backgroundColor: Colors.transparent,
      children: [
        SpinKitWave(
          color: Colors.blue,
        )
      ],
    );
  }
}
