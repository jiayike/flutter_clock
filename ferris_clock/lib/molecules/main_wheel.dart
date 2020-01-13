import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';
import '../atoms/ferris_support.dart';

class MainWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    final wheelSize = deviceHeight / 2;
    final innerWheelScale = 2;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          painter: HollowCircle(
            color: Colors.red,
            strokeWidth: 15
          ),
          child: Container(height: wheelSize, width: wheelSize)
        ),
        CustomPaint(
          painter: HollowCircle(
            color: Colors.green,
            strokeWidth: 10,
          ),
          child: Container(height: wheelSize / innerWheelScale, width: wheelSize / innerWheelScale)
        ),
        CustomPaint(
          painter: FerrisSupport(
            color: Colors.blue,
          ),
          child: Container(width: wheelSize / 4, height: wheelSize * 1.5),
        )
      ],
    );
  }
}
