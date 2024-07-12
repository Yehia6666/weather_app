import 'package:flutter/material.dart';
import 'package:weather_app_setup/models/weatherModel.dart';

class WeatherProvider extends ChangeNotifier {

  String? cityName ;
  WeatherModeL? _weatherDate ;
  set weatherData(WeatherModeL? weather){
    _weatherDate = weather ;
    notifyListeners() ;
  }
  WeatherModeL? get weatherData => _weatherDate ;
}