import 'package:dweather/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: textColor.withOpacity(0.3),
        highlightColor: textColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: textColor,
                ),
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 200,
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(24)),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(12)),
                height: 180,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(12)),
                height: 180,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: textColor, borderRadius: BorderRadius.circular(12)),
                height: 180,
              ),
            ],
          ),
        ));
  }
}
