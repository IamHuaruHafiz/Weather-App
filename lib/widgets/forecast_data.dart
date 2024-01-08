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
    var defaultPadding = MediaQuery.of(context).size.height * 0.02;
    return Column(
      children: [
        ForeCastToday(foreCastCurrentDay: foreCastCurrentDay),
        SizedBox(
          height: defaultPadding,
        ),
        ForeCastNextDay(
          foreCastDayOne: foreCastDayOne,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        ForeCastNextTwoDays(
          foreCastDayTwo: foreCastDayTwo,
        ),
      ],
    );
  }
}
