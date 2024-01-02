import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';

class ForeCastToday extends StatelessWidget {
  const ForeCastToday({
    super.key,
    required this.foreCastCurrentDay,
  });

  final ForeCastCurrentDay? foreCastCurrentDay;

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
                foreCastCurrentDay != null
                    ? "Condition: ${foreCastCurrentDay!.condition}"
                    : "",
                style: style,
              ),
              Text(
                "Today",
                style: style,
              ),
            ],
          ),
          Text(
            foreCastCurrentDay != null
                ? "MaxTemp: ${foreCastCurrentDay!.maxTempInC}°C / ${foreCastCurrentDay!.maxTempInF}°F"
                : "",
            style: style,
          ),
          Text(
            foreCastCurrentDay != null
                ? "MinTemp: ${foreCastCurrentDay!.minTempInC}°C / ${foreCastCurrentDay!.minTempInF}°F"
                : "",
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                foreCastCurrentDay != null
                    ? "Humidity: ${foreCastCurrentDay!.avgHumidity}"
                    : "",
                style: style,
              ),
              Text(
                foreCastCurrentDay != null
                    ? "WillRain:${foreCastCurrentDay!.dailyChanceOfRain == 0 ? "False" : "True"}"
                    : "",
                style: style,
              )
            ],
          )
        ],
      ),
    );
  }
}
