import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_setup/pages/home_screen.dart';
import 'package:weather_app_setup/provider/weather_provider.dart';



main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
          Provider.of<WeatherProvider>(context).weatherData == null
              ? Colors.blue
              : Provider.of<WeatherProvider>(context)
              .weatherData!
              .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
