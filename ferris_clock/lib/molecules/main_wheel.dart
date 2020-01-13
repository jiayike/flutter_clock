import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';
import '../atoms/ferris_support.dart';

class MainWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        CustomPaint(
            painter: HollowCircle(
                color: Colors.red,
                strokeWidth: 15,
                radius: _deviceWidth / 10)),
        CustomPaint(
            painter: HollowCircle(
                color: Colors.green,
                strokeWidth: 10,
                radius: _deviceWidth / 20)),
        CustomPaint(
          painter: FerrisSupport(
            color: Colors.blue,
          ),
          child: Container(width: 50, height: 100),
        )
      ],
    );
  }
}
