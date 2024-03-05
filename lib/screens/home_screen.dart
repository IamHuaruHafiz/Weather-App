import 'dart:async';
import 'dart:convert';
import 'package:dweather/widgets/display_current_weather.dart';
import 'package:dweather/widgets/forecast_data.dart';
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
  WeatherData? weatherData;
  Position? _currentPosition;
  bool locationEnabled = false;
  bool noData = false;

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;
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
    setState(() {
      locationEnabled = true;
    });
    return true;
  }

  Future getCurrentPosition() async {
    try {
      final getPermissions = await _handleLocationPermission();
      if (!getPermissions) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      });
      getCurrentWeather();
    } catch (e) {
      setState(() {
        locationEnabled = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Allow location services to continue"),
        ),
      );
    }
  }

  Future getCurrentWeather() async {
    try {
      final url =
          "https://weatherapi-com.p.rapidapi.com/forecast.json?q=${_currentPosition?.latitude}%2C${_currentPosition?.longitude}&days=3";
      final response = await http.get(Uri.parse(url), headers: {
        'X-RapidAPI-Key': secreteKey,
        'X-RapidAPI-Host': hostUrl,
      });
      if (response.statusCode == 200) {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          weatherData = WeatherData.fromJson(decodedResponse);
        });
      }
    } catch (e) {
      setState(() {
        noData = true;
      });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            GetLocationButton(),
          ],
        ),
        backgroundColor: bgColor,
        body: locationEnabled == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Allow Location Services",
                      style: TextStyle(color: textColor),
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.black45),
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.black)),
                        onPressed: () {
                          getCurrentPosition();
                        },
                        child: Text(
                          "Allow",
                          style: TextStyle(color: textColor),
                        ))
                  ],
                ),
              )
            : noData == true
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "An error occurred\nCheck your internet connection",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.black45),
                                foregroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.black)),
                            onPressed: () {
                              setState(() {
                                noData = false;
                                weatherData == null;
                              });
                              getCurrentPosition();
                            },
                            child: Text(
                              "Refresh",
                              style: TextStyle(color: textColor),
                            )),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: weatherData == null
                        ? const ShimmerEffect()
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DisplayCurrentWeather(
                                    currentWeather: weatherData),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Weather Forecast",
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton.outlined(
                                        onPressed: () {
                                          setState(() {
                                            weatherData = null;
                                          });
                                          getCurrentPosition();
                                        },
                                        icon: Icon(
                                          Icons.cyclone_sharp,
                                          color: textColor,
                                        ))
                                  ],
                                ),
                                noData == true
                                    ? const Center(
                                        child: Text("No data!"),
                                      )
                                    : ForecastData(
                                        foreCastWeather: weatherData,
                                      ),
                              ],
                            ),
                          ),
                  ));
  }
}
