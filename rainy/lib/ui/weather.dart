import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rainy/model/weatherData.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;
  Weather({@required this.weatherData});


  @override
  Widget build(BuildContext context) {
    Widget dateSection = Container (
child:  Text(
  DateFormat('MMMMd,H:m').format(DateTime.now()), 
  style: GoogleFonts.abrilFatface(
    textStyle: TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
    ),
  ),
),
);

Widget tempSection = Container(
  padding: EdgeInsets.symmetric(
    vertical:10.0,
  ),
  child:  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(weatherData.temp.toStringAsFixed(0), style: GoogleFonts.adamina(
        textStyle: TextStyle(fontSize: 50, color: Colors.white,
        ),
      ),),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(
            top:12.0,
          ),
          margin: EdgeInsets.only(
            left: 6.0,
          ),
          child: Text('\u2103',
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold ),
          ),),) ,),
         Image.network(

           'http://openweathermap.org/img/w/${weatherData.icon}.png',
           width: 100.0,
           height: 100.0,
          fit: BoxFit.cover),
    ],),
);
      Widget description = Container (
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(weatherData.name, style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold ),
            ),),
             Text(weatherData.main, style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 24, color: Colors.white ),
            ),),
          ],
          ),
);
    return Container(
      padding: EdgeInsets.all(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateSection,
          tempSection,
          description

        
      ],),
    );
  }
}