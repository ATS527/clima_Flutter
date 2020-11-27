import 'package:clima/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Location location = new Location();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  void getCurrentLocationData() async {
    await location.getCurrentLocation();
    print("Lattitude = ${location.lattitude}");
    print("Longitude = ${location.longitude}");
    //new class for http requests
    Networking networkHelper = new Networking(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=8fe38362917ee57e0dca1282c8a8ef47');
    await networkHelper.getData(); //getting data
    print("City Name = ${networkHelper.cityName}");
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocationData();
    return Scaffold();
  }
}
