import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplayCurrentWeather extends StatelessWidget {
  const DisplayCurrentWeather({
    super.key,
    required this.currentWeather,
  });

  final CurrentWeather? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          child: Lottie.asset("assets/animations/cloudThunder.json"),
        ),
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
                  color: navColor, fontSize: 25, fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
