import 'package:dweather/components/colors.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.name,
    required String? methodName,
  }) : _countryName = methodName;

  final String? _countryName;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "$name:",
                style: style,
              ),
            ),
            Flexible(
              child: Text(
                _countryName ?? "No data",
                style: style,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
