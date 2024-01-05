import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';

class ForeCastNextDay extends StatelessWidget {
  const ForeCastNextDay({
    super.key,
    required this.foreCastDayOne,
  });

  final ForeCastDayOne? foreCastDayOne;

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
                  foreCastDayOne != null
                      ? "Condition: ${foreCastDayOne!.condition}"
                      : "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: textColor),
                ),
              ),
              Flexible(
                child: Text(
                  foreCastDayOne != null ? foreCastDayOne!.date : "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: textColor),
                ),
              ),
            ],
          ),
          Text(
            foreCastDayOne != null
                ? "MaxTemp: ${foreCastDayOne!.maxTempInC}°C / ${foreCastDayOne!.maxTempInF}°F"
                : "",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: textColor),
          ),
          Text(
            foreCastDayOne != null
                ? "MinTemp: ${foreCastDayOne!.minTempInC}°C / ${foreCastDayOne!.minTempInF}°F"
                : "",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: textColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  foreCastDayOne != null
                      ? "Humidity: ${foreCastDayOne!.avgHumidity}"
                      : "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: textColor),
                ),
              ),
              Flexible(
                child: Text(
                  foreCastDayOne != null
                      ? "WillRain:${foreCastDayOne!.dailyChanceOfRain == 0 ? "False" : "True"}"
                      : "",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: textColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
