import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_setup/models/weatherModel.dart';
import 'package:weather_app_setup/provider/weather_provider.dart';

import '../weather_services/weather_services.dart';


class SearchPage extends StatelessWidget {

  SearchPage({this.updateUi});
  VoidCallback? updateUi ;
  String? cityName ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a City'),
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(

            onChanged: (data){
              cityName = data ;
            },
            onSubmitted: (date) async {
              cityName = date ;
              WeatherService service = WeatherService();
              WeatherModeL? weather = await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
              Provider.of<WeatherProvider>(context , listen: false).cityName = cityName ;
              Navigator.pop(context);

            },
            decoration: InputDecoration(

              suffixIcon: GestureDetector(
                child: Icon(Icons.search),
                onTap: ()  async {
                  WeatherService service = WeatherService();
                  WeatherModeL? weather = await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                  Provider.of<WeatherProvider>(context , listen: false).cityName = cityName ;
                  Navigator.pop(context);
                },
              ),
              hintText: 'Enter a city',
              label: Text('Search'),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 32 , horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }
}
