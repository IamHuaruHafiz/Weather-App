import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
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
import 'package:lottie/lottie.dart';

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

  Future<bool> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.vpn ||
        connectivityResult == ConnectivityResult.other) {
      return true;
    }
    return false;
  }

  bool noconnection = false;

  @override
  void initState() {
    var subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          noconnection = true;
        });
      }
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.vpn ||
          result == ConnectivityResult.other) {
        setState(() {
          noconnection = false;
        });
      }
      getCurrentPosition();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: noconnection == true
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
                actions: const [
                  GetLocationButton(),
                ],
              ),
        backgroundColor: bgColor,
        body: noconnection == true
            ? Center(
                child: Lottie.asset("assets/animations/network.json",
                    height: 200, width: 200),
              )
            : Padding(
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
                              child: foreCastCurrentDay == null
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: textColor,
                                      ),
                                    )
                                  : ListView(
                                      children: [
                                        ForeCastToday(
                                            foreCastCurrentDay:
                                                foreCastCurrentDay),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        ForeCastNextDay(
                                          foreCastDayOne: foreCastDayOne,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ForeCastNextTwoDays(
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
