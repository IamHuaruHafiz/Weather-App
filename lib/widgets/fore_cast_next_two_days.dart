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
      padding: const EdgeInsets.all(4),
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
              Text(
                foreCastDayTwo != null
                    ? "Condition: ${foreCastDayTwo!.condition}"
                    : "",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              ),
              Text(
                foreCastDayTwo != null ? foreCastDayTwo!.date : "",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              ),
            ],
          ),
          Text(
            foreCastDayTwo != null
                ? "MaxTemp: ${foreCastDayTwo!.maxTempInC}°C / ${foreCastDayTwo!.maxTempInF}°F"
                : "",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: textColor),
          ),
          Text(
            foreCastDayTwo != null
                ? "MinTemp: ${foreCastDayTwo!.minTempInC}°C / ${foreCastDayTwo!.minTempInF}°F"
                : "",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, color: textColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                foreCastDayTwo != null
                    ? "Humidity: ${foreCastDayTwo!.avgHumidity}"
                    : "",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              ),
              Text(
                foreCastDayTwo != null
                    ? "WillRain:${foreCastDayTwo!.dailyChanceOfRain == 0 ? "False" : "True"}"
                    : "",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
