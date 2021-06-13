import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idle_population_clicker/models/weather.dart';

class hava_durumu extends StatefulWidget {
  hava_durumu({@required this.weatherData});

  final WeatherData weatherData;

  @override
  _hava_durumuState createState() => _hava_durumuState();
}

class _hava_durumuState extends State<hava_durumu> {
  int temperature;
  Icon weatherDisplayIcon;
  AssetImage backgroundImage;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
      weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
              child: Text(
                'Gezegeninizdeki',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
              child: Text(
                'sıcaklık',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  letterSpacing: -5,
                ),
              ),
            ),
            Center(
              heightFactor: 8,
              child: Text(
                'Tebrikler! bir easteregg buldun :)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  //letterSpacing: -5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}