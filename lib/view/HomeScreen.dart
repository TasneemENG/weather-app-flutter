import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff94b5c6),
            child: Image.asset(
              "images/Colorful 3d Weather Forecast IOS Icon Set - Templates by Canva-Photoroom.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
                topLeft: Radius.circular(70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Welcome To Weather News & Feed",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "your ultimate weather companion! Get real-time updates, hourly forecasts, and 10-day predictions. Stay ahead with WeatherNow! 🌦️📅",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "WeatherScreen");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff16376d),
                        shape: CircleBorder(),
                      ),
                      child: Icon(Icons.arrow_forward_outlined, size: 50,color: Colors.white,),
                    ),
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
