import 'package:flutter/material.dart';

class WeatherModeL {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String wetherStateName;

  WeatherModeL(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.wetherStateName});

  factory WeatherModeL.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModeL(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        wetherStateName: jsonData['condition']['text']);
  }

  @override
  String toString(){

    return 'tem = $temp , date = $date , minTemp = $minTemp ';
  }

  String getImage(){
    if(wetherStateName == 'Clear' || wetherStateName == 'LightCloud'){
      return 'assets/images/clear.png' ;
    } else if(wetherStateName == 'Sleet' ||
        wetherStateName == 'Snow' ||
        wetherStateName == 'Hail'){
      return 'assets/images/snow.png' ;
    }else if(wetherStateName == 'Heavy Rain' ||
        wetherStateName == 'Shower' ||
        wetherStateName == 'Light Rain'){
      return 'assets/images/rainy.png' ;
    }else if(wetherStateName == 'Heavy Cloud'){
      return 'assets/images/cloudy.png' ;
    }else if(wetherStateName == 'Thunderstorm' || wetherStateName == 'Thunder'){
      return 'assets/images/thunderstorm.png' ;
    }else {
      return 'assets/images/clear.png' ;
    }
  }

  MaterialColor getThemeColor(){
    if(wetherStateName == 'Clear' || wetherStateName == 'LightCloud' || wetherStateName == 'Cloudy' ){
      return Colors.blueGrey ;
    } else if(wetherStateName == 'Sleet' ||
        wetherStateName == 'Snow' ||
        wetherStateName == 'Hail'){
      return Colors.blue ;
    }else if(wetherStateName == 'Heavy Rain' ||
        wetherStateName == 'Shower' ||
        wetherStateName == 'Libght Rain'){
      return Colors.blue ;
    }else if(wetherStateName == 'Heavy Cloud'){
      return Colors.blueGrey ;
    }else if(wetherStateName == 'Thunderstorm' || wetherStateName == 'Thunder'){
      return Colors.deepPurple ;
    }else {
      return Colors.orange ;
    }
  }
}
