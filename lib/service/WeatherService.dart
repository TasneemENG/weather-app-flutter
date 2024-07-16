import 'package:dio/dio.dart';
import 'package:weather_app/model/WeatherDataModel.dart';
import 'package:geocoding/geocoding.dart';
class WeatherService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.open-meteo.com/v1/forecast";

  Future<Weather?> fetchCurrentWeatherData(latitude,longitude) async {
    try {
      final response = await _dio.get(
        // "$_baseUrl?latitude=52.5244&longitude=13.4105&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto",
        "$_baseUrl?latitude=$latitude&longitude=$longitude&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto",
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        print(response.data);
        return Weather.fromJson(data);
      } else {
        throw Exception('Failed to fetch current weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch current weather data: $e');
    }
  }


  Future<String> fetchCityNameFromLatLng(double latitude, double longitude) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        return placemark.locality ?? "Unknown";
      }
    } catch (e) {
      print('Failed to fetch city name: $e');
    }
    return "Unknown";
  }



}
class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}
