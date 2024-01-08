import 'package:cached_network_image/cached_network_image.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 100,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "https:${currentWeather!.icon.toString()}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: textColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
