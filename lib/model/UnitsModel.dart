class Units {
  String? temperature2m;

  Units({
    this.temperature2m,
  });

  factory Units.fromJson(Map<String, dynamic> json) => Units(
    temperature2m: json["temperature_2m"],
  );

  Map<String, dynamic> toJson() => {
    "temperature_2m": temperature2m,
  };
}
