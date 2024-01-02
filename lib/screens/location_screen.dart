import 'package:dweather/components/colors.dart';
import 'package:dweather/models/weather.dart';
import 'package:dweather/widgets/row_item.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _subLocality;
  String? _postalCode;
  String? _countryName;
  String? _countryCode;
  String? _streetName;
  String? _localityName;
  String? _administrativeArea;
  String? _name;
  String? _subAdministrativeArea;
  Position? _currentPosition;
  bool isLoading = false;
  CurrentWeather? currentWeather;
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
    setState(() {
      isLoading = true;
    });
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      getLocationFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> getLocationFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      final Placemark place = placemarks[0];
      setState(() {
        _subLocality = "${place.subLocality}";
        _administrativeArea = "${place.administrativeArea}";
        _countryCode = "${place.isoCountryCode}";
        _postalCode = "${place.postalCode}";
        _streetName = "${place.street}";
        _countryName = "${place.country}";
        _localityName = "${place.locality}";
        _subAdministrativeArea = "${place.subAdministrativeArea}";
        _name = "${place.name}";
        isLoading = false;
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Know your location",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                RowItem(name: "Locality", methodName: _localityName),
                RowItem(name: "Name", methodName: _name),
                RowItem(name: "Sublocality", methodName: _subLocality),
                RowItem(
                    name: "Administrative area",
                    methodName: _administrativeArea),
                RowItem(
                    name: "Sub-Administrative area",
                    methodName: _subAdministrativeArea),
                RowItem(name: "Street name", methodName: _streetName),
                RowItem(name: "Country name", methodName: _countryName),
                RowItem(name: "Country code", methodName: _countryCode),
                RowItem(
                    name: "Latitude",
                    methodName: _currentPosition?.latitude.toString()),
                RowItem(
                    name: "Longitude",
                    methodName: _currentPosition?.longitude.toString()),
                RowItem(name: "Postal code", methodName: _postalCode),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? CircularProgressIndicator(
                        color: textColor,
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(bgColor),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(textColor)),
                        onPressed: () {
                          getCurrentPosition();
                        },
                        child: const Text(
                          "Get current location",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ))
              ],
            ),
          ),
        ));
  }
}
