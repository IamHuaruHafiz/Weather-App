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
            number == 0
                ? "MaxTemp: ${weatherData!.currentDaymaxTempInC}°C / ${weatherData!.currentDaymaxTempInF}°F"
                : number == 1
                    ? "MaxTemp: ${weatherData!.nextDaymaxTempInC}°C / ${weatherData!.nextDaymaxTempInF}°F"
                    : "MaxTemp: ${weatherData!.nextTwoDaysmaxTempInC}°C / ${weatherData!.nextTwoDaysmaxTempInF}°F",
            style: style,
          ),
          Text(
            number == 0
                ? "MinTemp: ${weatherData!.currentDayminTempInC}°C / ${weatherData!.currentDayminTempInF}°F"
                : number == 1
                    ? "MinTemp: ${weatherData!.nextDayminTempInC}°C / ${weatherData!.nextDayminTempInF}°F"
                    : "MinTemp: ${weatherData!.nextTwoDaysminTempInC}°C / ${weatherData!.nextTwoDaysminTempInF}°F",
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  number == 0
                      ? "Humidity: ${weatherData!.currentDayavgHumidity}"
                      : number == 1
                          ? "Humidity: ${weatherData!.nextDayavgHumidity}"
                          : "Humidity: ${weatherData!.nextTwoDaysavgHumidity}",
                  style: style,
                ),
              ),
              Flexible(
                child: Text(
                  number == 0
                      ? "WillRain:${weatherData!.currentDaydailyChanceOfRain == 0 ? "False" : "True"}"
                      : number == 1
                          ? "WillRain:${weatherData!.nextDaydailyChanceOfRain == 0 ? "False" : "True"}"
                          : "WillRain:${weatherData!.nextTwoDaysdailyChanceOfRain == 0 ? "False" : "True"}",
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
