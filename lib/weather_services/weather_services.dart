import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:weather_app_setup/models/weatherModel.dart';

class WeatherService {
  String UrlBase = 'http://api.weatherapi.com/v1';
  String ApiKey = '61d0430d3f58494da36111052230708';

  Future<WeatherModeL?> getWeather({required String cityName}) async {

    WeatherModeL? weather ;

    try {
      Uri url =
      Uri.parse('$UrlBase/forecast.json?key=$ApiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModeL.fromJson(data);
    } catch(e){
      print(e);
    }

    return weather ;



  }
}
