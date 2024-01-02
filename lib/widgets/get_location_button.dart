import 'package:dweather/components/colors.dart';
import 'package:dweather/screens/location_screen.dart';
import 'package:flutter/material.dart';

class GetLocationButton extends StatelessWidget {
  const GetLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LocationScreen(),
            ),
          );
        },
        icon: Icon(
          Icons.location_on_outlined,
          color: textColor,
        ));
  }
}
