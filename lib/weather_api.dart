import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/foundation.dart';

class CityInfo {
  String? cityName;
  String? temperature;
  String? weatherCondition;

  CityInfo(this.cityName, this.temperature, this.weatherCondition);
}

Future<CityInfo?> getResponse(String query) async {
  const String apiKey = "f6aedda0032042e1812150300231109";
  var uri = Uri.http("api.weatherapi.com", "/v1/current.json", {"q": query});
  final response = await http.get(uri, headers: {"key": apiKey});

  if (response.statusCode == 200) {
    if (kDebugMode) {
      var responseJson = jsonDecode(response.body);

      return CityInfo(
          responseJson["location"]["name"],
          "${responseJson["current"]["temp_c"]}\u2103",
          responseJson["current"]["condition"]["text"]);
    }
  } else {
    if (kDebugMode) {
      print("my data: ${response.statusCode}");
    }
  }
  return null;
}
