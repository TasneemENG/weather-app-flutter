import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_app/model/WeatherDataModel.dart';
import 'package:weather_app/service/WeatherService.dart';
import 'package:weather_app/widget/DailyWeatherCard.dart';
import 'package:weather_app/widget/HourlyCard.dart';
import 'package:weather_app/widget/WeatherCard.dart';
import 'package:geocoding/geocoding.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? _weatherData;
  final WeatherService _weatherService = WeatherService();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final _searchController = SearchController();
  String? _cityName;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }
  Future<LatLng> _fetchCoordinates(String cityName) async {
    try {
      final locations = await locationFromAddress(cityName);
      if (locations.isNotEmpty) {
        final location = locations.first;
        return LatLng(location.latitude, location.longitude);
      }
    } catch (e) {
      print('Failed to fetch coordinates: $e');
    }
    return LatLng(0.0, 0.0);
  }

  Future<void> _fetchWeatherData() async {
    try {
      double latitude, longitude;
      String cityName = _searchController.text;

      if (cityName.isNotEmpty) {
        final coordinates = await _fetchCoordinates(cityName);
        latitude = coordinates.latitude;
        longitude = coordinates.longitude;
      } else {
        latitude = double.tryParse(latitudeController.text) ?? 52.52437;
        longitude = double.tryParse(longitudeController.text) ?? 13.41053;
      }

      final weatherData = await _weatherService.fetchCurrentWeatherData(
        latitude,
        longitude,
      );

      setState(() {
        _weatherData = weatherData;
      });

      fetchCityNameFromLatLng(latitude, longitude);
    } catch (e) {
      print('Failed to fetch weather data: $e');
    }
  }

  Future<void> fetchCityNameFromLatLng(double latitude, double longitude) async {
    try {
      final cityName = await _weatherService.fetchCityNameFromLatLng(latitude, longitude);
      setState(() {
        _cityName = cityName;
      });
    } catch (e) {
      print('Failed to fetch city name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff94b5c6),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(
              //       "images/15 космических обоев для смартфонов - Лайфхакер.jpeg"),
              //   fit: BoxFit.cover,
              // ),
              color: Color(0xff000c38),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: _searchController,
                                onChanged: (value) {
                                },
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    _fetchWeatherData();
                                  } else {

                                    }
                                },
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  suffixIcon: Icon(Icons.search, color: Colors.white),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: latitudeController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue.withOpacity(0.7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Latitude',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: longitudeController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Longitude',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _fetchWeatherData,
                          child: Text('Fetch Weather',style: TextStyle(
                            color: Colors.blue,
                          ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_weatherData != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          WeatherCard(
                            weather: _weatherData!,
                            weatherService: _weatherService,
                            cityName: _cityName,
                          ),
                          SizedBox(height:30.0),

                          if (_weatherData!.hourly != null)
                            HourlyWeatherCard(
                              time: _weatherData!.hourly!.time!,
                              temperature2m: _weatherData!.hourly!.temperature2m!,
                            ),
                          SizedBox(height: 20),
                          if (_weatherData!.daily != null)
                            DailyWeatherCard(
                              days: _weatherData!.daily!.time!,
                              maxTemperatures:
                              _weatherData!.daily!.temperature2MMax!,
                              minTemperatures:
                              _weatherData!.daily!.temperature2MMin!,
                            ),
                        ],
                      ),
                    ),
                  if (_weatherData == null)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}