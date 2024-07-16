class Current {
  String? time;
  int? interval;
  double? temperature2m;
  double? windSpeed10m;

  Current({
    this.time,
    this.interval,
    this.temperature2m,
    this.windSpeed10m,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"],
    interval: json["interval"],
    temperature2m: json["temperature_2m"]?.toDouble(),
    windSpeed10m: json["wind_speed_10m"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2m,
    "wind_speed_10m": windSpeed10m,
  };
}


class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;
  String? windSpeed10m;

  CurrentUnits({
    this.time,
    this.interval,
    this.temperature2m,
    this.windSpeed10m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
    time: json["time"],
    interval: json["interval"],
    temperature2m: json["temperature_2m"],
    windSpeed10m: json["wind_speed_10m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2m,
    "wind_speed_10m": windSpeed10m,
  };
}
