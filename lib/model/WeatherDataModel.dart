import 'dart:convert';

import 'package:weather_app/model/CurrentModel.dart';
import 'package:weather_app/model/DailyModel.dart';
import 'package:weather_app/model/HourlyModel.dart';
import 'package:weather_app/model/UnitsModel.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  Units? currentUnits;
  Current? current;
  Units? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  Weather({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    generationtimeMs: json["generationtime_ms"]?.toDouble(),
    utcOffsetSeconds: json["utc_offset_seconds"],
    timezone: json["timezone"],
    timezoneAbbreviation: json["timezone_abbreviation"],
    elevation: json["elevation"],
    currentUnits: json["current_units"] == null ? null : Units.fromJson(json["current_units"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    hourlyUnits: json["hourly_units"] == null ? null : Units.fromJson(json["hourly_units"]),
    hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
    dailyUnits: json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]),
    daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits?.toJson(),
    "current": current?.toJson(),
    "hourly_units": hourlyUnits?.toJson(),
    "hourly": hourly?.toJson(),
    "daily_units": dailyUnits?.toJson(),
    "daily": daily?.toJson(),
  };
}