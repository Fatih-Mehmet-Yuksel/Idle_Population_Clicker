import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idle_population_clicker/models/location.dart';
import 'dart:async';
import 'package:idle_population_clicker/models/weather.dart';

import 'package:idle_population_clicker/pages/diger/hava_durumu.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      // todo: Handle no location
    }
    print(locationData.longitude);
    print(locationData.latitude);
  }

  void getWeatherData() async {
    // Fetch the location
    await getLocationData();

    // Fetch the current weather
    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if (weatherData.currentTemperature == null ||
        weatherData.currentCondition == null) {
      // todo: Handle no weather
    }
    print(weatherData.currentTemperature);
    print(weatherData.currentCondition);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return hava_durumu(
            weatherData: weatherData,
          );
        },
      ),
    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEC407A), Color(0xFF15182D)],
          ),
        ),
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 150.0,
            duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}