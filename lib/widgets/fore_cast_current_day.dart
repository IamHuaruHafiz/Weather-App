import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';

class ForeCastToday extends StatelessWidget {
  const ForeCastToday({
    super.key,
    required this.weatherData,
    required this.number,
  });

  final WeatherData? weatherData;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2,
              color: borderColor,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignOutside)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  weatherData != null
                      ? "Condition: ${number == 0 ? weatherData!.condition : number == 1 ? weatherData!.nextDaycondition : weatherData!.nextTwoDayscondition}"
                      : "",
                  style: style,
                ),
              ),
              Flexible(
                child: Text(
                  number == 0
                      ? "Today"
                      : number == 1
                          ? weatherData!.nextDayDate
                          : weatherData!.nextTwoDaysDate,
                  style: style,
                ),
              ),
            ],
          ),
          Text(
            weatherData != null
                ? "MaxTemp: ${number == 0 ? weatherData!.currentDaymaxTempInC : number == 1 ? weatherData!.nextDaymaxTempInC : weatherData!.nextTwoDaysmaxTempInC}°C / ${number == 0 ? weatherData!.currentDaymaxTempInF : number == 1 ? weatherData!.nextDaymaxTempInF : weatherData!.nextTwoDaysmaxTempInF}°F"
                : "",
            style: style,
          ),
          Text(
            weatherData != null
                ? "MinTemp: ${number == 0 ? weatherData!.currentDayminTempInC : number == 1 ? weatherData!.nextDayminTempInC : weatherData!.nextTwoDaysminTempInC}°C / ${number == 0 ? weatherData!.currentDayminTempInF : number == 1 ? weatherData!.nextDayminTempInF : weatherData!.nextTwoDaysminTempInF}°F"
                : "",
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  weatherData != null
                      ? "Humidity: ${number == 0 ? weatherData!.currentDayavgHumidity : number == 1 ? weatherData!.nextDayavgHumidity : weatherData!.nextTwoDaysavgHumidity}"
                      : "",
                  style: style,
                ),
              ),
              Flexible(
                child: Text(
                  weatherData != null
                      ? "WillRain:${(number == 0 ? weatherData!.currentDaydailyChanceOfRain : number == 1 ? weatherData!.nextDaydailyChanceOfRain : weatherData!.nextTwoDaysdailyChanceOfRain) == 0 ? "False" : "True"}"
                      : "",
                  style: style,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
