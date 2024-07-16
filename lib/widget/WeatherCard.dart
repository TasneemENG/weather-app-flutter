import 'package:flutter/material.dart';
import 'package:weather_app/model/WeatherDataModel.dart';
import 'package:weather_app/service/WeatherService.dart';

class WeatherCard extends StatefulWidget {
  final Weather weather;
  final WeatherService weatherService;
  final String? cityName;

  const WeatherCard({
    Key? key,
    required this.weather,
    required this.weatherService,
    required this.cityName,
  }) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {



  @override
  void initState() {
    super.initState();
  }


  String getWeatherIcon(double? temperature) {
    if (temperature == null) return 'images/partly-cloud.png';

    if (temperature < 0) {
      return 'images/snow.png';
    } else if (temperature < 10) {
      return 'images/clouds.png';
    } else if (temperature < 20) {
      return 'images/rain.png';
    } else if (temperature < 30) {
      return 'images/partly-cloud.png';
    } else {
      return 'images/clear-sky.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.withOpacity(.3),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getGreeting(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${DateTime.now().day} ${_monthName(DateTime.now().month)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Text(
                    '${widget.weather.current!.temperature2m}°C ',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (widget.cityName != null)
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white54, size: 25),
                        SizedBox(width: 10),
                        Text(
                          '${widget.cityName}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(getWeatherIcon(widget.weather.current!.temperature2m)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        '${widget.weather!.current!.windSpeed10m!} km/h',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
              
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'images/speed.png',
                        width: 45,
                        height: 45,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning!';
    } else if (hour < 18) {
      return 'Good afternoon!';
    } else {
      return 'Good evening!';
    }
  }
}
