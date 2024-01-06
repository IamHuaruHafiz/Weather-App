import 'package:dweather/models/weather.dart';
import 'package:dweather/widgets/fore_cast_current_day.dart';
import 'package:dweather/widgets/fore_cast_next_day.dart';
import 'package:dweather/widgets/fore_cast_next_two_days.dart';
import 'package:flutter/material.dart';

class ForecastData extends StatelessWidget {
  const ForecastData({
    super.key,
    required this.foreCastCurrentDay,
    required this.foreCastDayOne,
    required this.foreCastDayTwo,
  });

  final ForeCastCurrentDay? foreCastCurrentDay;
  final ForeCastDayOne? foreCastDayOne;
  final ForeCastDayTwo? foreCastDayTwo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ForeCastToday(foreCastCurrentDay: foreCastCurrentDay),
        const SizedBox(
          height: 12,
        ),
        ForeCastNextDay(
          foreCastDayOne: foreCastDayOne,
        ),
        const SizedBox(
          height: 15,
        ),
        ForeCastNextTwoDays(
          foreCastDayTwo: foreCastDayTwo,
        ),
      ],
    );
  }
}
