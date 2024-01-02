import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';

class DisplayCurrentWeather extends StatelessWidget {
  const DisplayCurrentWeather({
    super.key,
    required this.currentWeather,
  });
  final CurrentWeather? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 150,
            child: Image.network(
              "https:${currentWeather!.icon.toString()}",
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            )),
        Text(
          "${currentWeather!.tempInC.toString()}°C",
          style: TextStyle(
              color: textColor, fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_pin,
              color: textColor,
            ),
            Text(
              currentWeather!.name,
              style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
