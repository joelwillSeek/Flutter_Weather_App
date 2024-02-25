import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:http/http.dart" as http;
import 'package:flutter/foundation.dart';

class CityInfo {
  String? _cityName;
  String? _temperature;
  String? _weatherCondition;
  String? _windSpeedInKph;
  String? _humidity;
  String? _icon;

  CityInfo(this._cityName, this._temperature, this._icon,
      this._weatherCondition, this._windSpeedInKph, this._humidity);

  String? get cityName {
    return _cityName;
  }

  String? get temperature {
    return _temperature;
  }

  String? get weatherCondition {
    return _weatherCondition;
  }

  String? get windSpeedInKph {
    return _windSpeedInKph;
  }

  String? get humidity {
    return _humidity;
  }

  String? get icon {
    String? modifiedUri = "http:$_icon";
    return modifiedUri;
  }
}

Future<CityInfo?> getResponse(String query, BuildContext context) async {
  const String apiKey = "f6aedda0032042e1812150300231109";

  var uri = Uri.http("api.weatherapi.com", "/v1/current.json", {"q": query});

  final response = await http.get(uri, headers: {"key": apiKey});

  if (context.mounted) {
    Navigator.of(context).pop();
  }

  if (response.statusCode == 200) {
    if (kDebugMode) {
      var responseJson = jsonDecode(response.body);

      String cityName = responseJson["location"]["name"];
      String temperature = "${responseJson["current"]["temp_c"]}\u2103";
      String weatherIcon = responseJson["current"]["condition"]["icon"];
      String weatherCondition = responseJson["current"]["condition"]["text"];
      String windSpeedInKph = responseJson["current"]["wind_kph"];
      String humidity = responseJson["current"]["humidity"];

      print("kph $windSpeedInKph");

      return CityInfo(cityName, temperature, weatherIcon, weatherCondition,
          windSpeedInKph, humidity);
    }
  } else {
    if (kDebugMode) {
      print("my data: ${response.statusCode}");
    }
  }

  return null;
}
