import 'package:flutter/material.dart';

class HourlyWeatherCard extends StatelessWidget {
  final List<String> time;
  final List<double> temperature2m;

  const HourlyWeatherCard({
    Key? key,
    required this.time,
    required this.temperature2m,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: time.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/clock.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  _buildTimeText(time[index]),
                  SizedBox(height: 4),
                  Text(
                    '${temperature2m[index].toStringAsFixed(0)}°C',
                    style: TextStyle(fontSize: 14, color: Color(0xff000c38), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to format time text
  Widget _buildTimeText(String time) {
    // Splitting time to get hours and minutes
    List<String> timeParts = time.split('T')[1].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Getting AM or PM based on hour
    String period = hour < 12 ? 'AM' : 'PM';

    // Formatting hour to 12-hour format
    if (hour > 12) hour -= 12;

    // Build formatted time text
    return Text(
      '$hour:${minute.toString().padLeft(2, '0')} $period',
      style: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
