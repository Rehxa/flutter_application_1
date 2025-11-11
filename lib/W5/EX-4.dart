import 'package:flutter/material.dart';

enum Weather {
  cloudy(
    image: "assets/ex4/cloudy.png",
    locationName: "Phnom Penh",
    currentTemp: "12.2°C",
    maxTemp: "Max 30.0°C",
    minTemp: "Min 10.0°C",
    startColor: Color(0xffC17EE3),
    endColor: Color(0xffA37DF0),
  ),
  sunny(
    image: "assets/ex4/sunny.png",
    locationName: "Rome",
    currentTemp: "45.2°C",
    maxTemp: "Max 40.0°C",
    minTemp: "Min 10.0°C",
    startColor: Color(0xffEA6290),
    endColor: Color(0xffD9597E),
  ),
  sunnyCloudy(
    image: "assets/ex4/sunnyCloudy.png",
    locationName: "Paris",
    currentTemp: "22.2°C",
    maxTemp: "Max 40.0°C",
    minTemp: "Min 10.0°C",
    startColor: Color(0xff80E7CD),
    endColor: Color(0xff5AE5C1),
  ),
  veryCloudy(
    image: "assets/ex4/veryCloudy.png",
    locationName: "Toulouse",
    currentTemp: "45.2°C",
    maxTemp: "Max 40.0°C",
    minTemp: "Min 10.0°C",
    startColor: Color(0xffF7AC70),
    endColor: Color(0xffEBC199),
  );

  final String image;
  final String locationName;
  final String currentTemp;
  final String maxTemp;
  final String minTemp;

  final Color startColor;
  final Color endColor;

  const Weather({
    required this.image,
    required this.locationName,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.startColor,
    required this.endColor,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),

          child: ListView(
            children: [
              SizedBox(height: 10),
              WeatherCard(weather: Weather.cloudy),
              SizedBox(height: 10),

              WeatherCard(weather: Weather.sunnyCloudy),
              SizedBox(height: 10),

              WeatherCard(weather: Weather.sunny),
              SizedBox(height: 10),

              WeatherCard(weather: Weather.veryCloudy),
              SizedBox(height: 10),

              // WeatherCard(weather: Weather.cloudy),
              // SizedBox(height: 10),

              // WeatherCard(weather: Weather.sunnyCloudy),
              // SizedBox(height: 10),

              // WeatherCard(weather: Weather.sunny),
              // SizedBox(height: 10),

              // WeatherCard(weather: Weather.veryCloudy),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Color(0xffffffff),
      clipBehavior: Clip.none,
      elevation: 5,
      borderRadius: BorderRadius.circular(20),

      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [weather.startColor, weather.endColor],
          ),
          borderRadius: BorderRadius.circular(20),
        ),

        child: Stack(
          children: [
            Positioned(
              bottom: -60,
              right: -50,

              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [weather.startColor, weather.endColor],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundImage: AssetImage(weather.image),
                      ),

                      SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather.locationName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            weather.minTemp,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            weather.maxTemp,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(
                    weather.currentTemp,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
