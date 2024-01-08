import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';

class ForeCastNextTwoDays extends StatelessWidget {
  const ForeCastNextTwoDays({
    super.key,
    required this.foreCastDayTwo,
  });

  final ForeCastDayTwo? foreCastDayTwo;

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
                  foreCastDayTwo != null
                      ? "Condition: ${foreCastDayTwo!.condition}"
                      : "",
                  style: style,
                ),
              ),
              Flexible(
                child: Text(
                  foreCastDayTwo != null ? foreCastDayTwo!.date : "",
                  style: style,
                ),
              ),
            ],
          ),
          Text(
            foreCastDayTwo != null
                ? "MaxTemp: ${foreCastDayTwo!.maxTempInC}°C / ${foreCastDayTwo!.maxTempInF}°F"
                : "",
            style: style,
          ),
          Text(
            foreCastDayTwo != null
                ? "MinTemp: ${foreCastDayTwo!.minTempInC}°C / ${foreCastDayTwo!.minTempInF}°F"
                : "",
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  foreCastDayTwo != null
                      ? "Humidity: ${foreCastDayTwo!.avgHumidity}"
                      : "",
                  style: style,
                ),
              ),
              Flexible(
                child: Text(
                  foreCastDayTwo != null
                      ? "WillRain:${foreCastDayTwo!.dailyChanceOfRain == 0 ? "False" : "True"}"
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
