import 'package:flutter/material.dart';
import 'package:rainy/ui/weather.dart';
import 'package:rainy/model/weatherData.dart';
import 'package:rainy/api/MapApi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherData _weatherData;

  @override
  void initState() {
    
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Rainy'),
        ),
        body: _weatherData != null ? Weather(weatherData: _weatherData):
        Center(
          child: CircularProgressIndicator(
            strokeWidth:  4.0,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
        
      ),
    );
     

    
     
  }
   getCurrentLocation() {
    loadWeather(lat: 40.71, lon: -74.01);
  }


  loadWeather({double lat, double lon}) async{
      MapApi mapApi = MapApi.getInstance();
      final data = await mapApi.getWeather(lat, lon);
      setState(() {
       this._weatherData = data;
      });

    }
}