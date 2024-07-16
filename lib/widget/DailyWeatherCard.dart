import 'package:flutter/material.dart';

class DailyWeatherCard extends StatelessWidget {
  final List<String> days;
  final List<double> maxTemperatures;
  final List<double> minTemperatures;

  const DailyWeatherCard({
    Key? key,
    required this.days,
    required this.maxTemperatures,
    required this.minTemperatures,
  }) : super(key: key);

  String getWeatherIcon(double? maxTemperature) {
    if (maxTemperature == null) return 'images/partly-cloud.png';

    if (maxTemperature < 0) {
      return 'images/snow.png';
    } else if (maxTemperature < 10) {
      return 'images/fog.png';
    } else if (maxTemperature < 20) {
      return 'images/rain.png';
    } else if (maxTemperature < 30) {
      return 'images/partly-cloud.png';
    } else {
      return 'images/clear-sky.png';
    }
  }

  String getDayName(int index) {
    List<String> dayNames = ['Monday', 'Tuesday', 'Wednes', 'Thurs', 'Friday', 'Saturday', 'Sunday'];
    return dayNames[(index + DateTime.now().weekday - 1) % 7];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            child: Card(
              elevation: 0,
              color: Color(0xff000c38).withOpacity(.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(getWeatherIcon(maxTemperatures[index])),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      getDayName(index),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: Colors.red,
                        ),
                        Text(
                          '${maxTemperatures[index].toStringAsFixed(0)}°C',
                          style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                        ),
                        Text(
                          '${minTemperatures[index].toStringAsFixed(0)}°C',
                          style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
