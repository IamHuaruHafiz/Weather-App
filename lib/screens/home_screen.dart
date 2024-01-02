import 'dart:convert';
import 'package:dweather/widgets/display_current_weather.dart';
import 'package:dweather/widgets/fore_cast_current_day.dart';
import 'package:dweather/widgets/fore_cast_next_day.dart';
import 'package:dweather/widgets/fore_cast_next_two_days.dart';
import 'package:dweather/widgets/get_location_button.dart';
import 'package:dweather/widgets/shimmer_effect.dart';
import 'package:http/http.dart' as http;
import 'package:dweather/components/api_key.dart';
import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentWeather? currentWeather;
  ForeCastCurrentDay? foreCastCurrentDay;
  ForeCastDayOne? foreCastDayOne;
  ForeCastDayTwo? foreCastDayTwo;
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Location services are disabled. Please enable the services"),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Location permissions are denied"),
          ),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Location permissions are permanently denied, we cannot request permissions."),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final getPermissions = await _handleLocationPermission();
    if (!getPermissions) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      getCurrentWeather();
      getForecastWeather();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future getCurrentWeather() async {
    final url =
        "https://weatherapi-com.p.rapidapi.com/current.json?q=${_currentPosition?.latitude}%2C${_currentPosition?.longitude}";
    final response = await http.get(Uri.parse(url), headers: {
      'X-RapidAPI-Key': secreteKey,
      'X-RapidAPI-Host': hostUrl,
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      setState(() {
        currentWeather = CurrentWeather.fromJson(decodedResponse);
      });
    }
  }

  Future getForecastWeather() async {
    final url =
        "https://weatherapi-com.p.rapidapi.com/forecast.json?q=${_currentPosition?.latitude}%2C${_currentPosition?.longitude}&days=3";
    final response = await http.get(Uri.parse(url), headers: {
      'X-RapidAPI-Key': secreteKey,
      'X-RapidAPI-Host': hostUrl,
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        foreCastCurrentDay = ForeCastCurrentDay.fromJson(decodedResponse);
        foreCastDayOne = ForeCastDayOne.fromJson(decodedResponse);
        foreCastDayTwo = ForeCastDayTwo.fromJson(decodedResponse);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [
            GetLocationButton(),
          ],
        ),
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: currentWeather == null
              ? const ShimmerEffect()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplayCurrentWeather(currentWeather: currentWeather),
                    Text(
                      "Weather Forecast",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        color: bgColor,
                        onRefresh: () async {
                          await getCurrentPosition();
                        },
                        child: ListView(
                          children: [
                            ForeCastToday(
                                foreCastCurrentDay: foreCastCurrentDay),
                            const SizedBox(
                              height: 12,
                            ),
                            foreCastDayOne == null
                                ? const ShimmerEffect()
                                : ForeCastNextDay(
                                    foreCastDayOne: foreCastDayOne,
                                  ),
                            const SizedBox(
                              height: 15,
                            ),
                            foreCastDayTwo == null
                                ? const ShimmerEffect()
                                : ForeCastNextTwoDays(
                                    foreCastDayTwo: foreCastDayTwo,
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
