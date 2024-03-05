import 'package:dweather/models/weather.dart';
import 'package:dweather/widgets/fore_cast_current_day.dart';
import 'package:flutter/material.dart';

class ForecastData extends StatelessWidget {
  const ForecastData({
    super.key,
    required this.foreCastWeather,
  });

  final WeatherData? foreCastWeather;

  @override
  Widget build(BuildContext context) {
    var defaultPadding = MediaQuery.of(context).size.height * 0.02;
    return Column(
      children: [
        ForeCastToday(
          weatherData: foreCastWeather,
          number: 0,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        ForeCastToday(
          weatherData: foreCastWeather,
          number: 1,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        ForeCastToday(
          weatherData: foreCastWeather,
          number: 2,
        ),
      ],
    );
  }
}
