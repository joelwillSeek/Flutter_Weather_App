class CityInfo {
  final String? _cityName;
  final String? _temperature;
  final String? _weatherCondition;
  final String? _windSpeedInKph;
  final String? _humidity;
  final String? _icon;

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
