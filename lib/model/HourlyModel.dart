class Hourly {
  List<String>? time;
  List<double>? temperature2m;

  Hourly({
    this.time,
    this.temperature2m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: List<String>.from(json["time"].map((x) => x)),
    temperature2m: List<double>.from(json["temperature_2m"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": List<dynamic>.from(time!.map((x) => x)),
    "temperature_2m": List<dynamic>.from(temperature2m!.map((x) => x)),
  };
}

class HourlyUnits {
  String? time;
  String? temperature2m;

  HourlyUnits({
    this.time,
    this.temperature2m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
    time: json["time"],
    temperature2m: json["temperature_2m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m": temperature2m,
  };
}
