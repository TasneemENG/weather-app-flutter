class Daily {
  List<String>? time;
  List<num>? weatherCode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;

  Daily({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    time: List<String>.from(json["time"].map((x) => x)),
    weatherCode: json["weather_code"] == null ? [] : List<int>.from(json["weather_code"]!.map((x) => x)),
    temperature2MMax: json["temperature_2m_max"] == null ? [] : List<double>.from(json["temperature_2m_max"]!.map((x) => x?.toDouble())),
    temperature2MMin: json["temperature_2m_min"] == null ? [] : List<double>.from(json["temperature_2m_min"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
    "weather_code": weatherCode == null ? [] : List<dynamic>.from(weatherCode!.map((x) => x)),
    "temperature_2m_max": temperature2MMax == null ? [] : List<dynamic>.from(temperature2MMax!.map((x) => x)),
    "temperature_2m_min": temperature2MMin == null ? [] : List<dynamic>.from(temperature2MMin!.map((x) => x)),
  };
}

class DailyUnits {
  String? time;
  String? weatherCode;
  String? temperature2MMax;
  String? temperature2MMin;

  DailyUnits({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
    time: json["time"],
    weatherCode: json["weather_code"],
    temperature2MMax: json["temperature_2m_max"],
    temperature2MMin: json["temperature_2m_min"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "temperature_2m_max": temperature2MMax,
    "temperature_2m_min": temperature2MMin,
  };
}