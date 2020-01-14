import 'package:flutter/material.dart';

import '../atoms/ferris_support.dart';
import '../organisms/main_wheel.dart';

class FerrisClock extends StatelessWidget {

  final Color baseColor;

  FerrisClock({
    @required this.baseColor
  })  : assert(baseColor != null);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double wheelSize = deviceHeight / 1.8;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        MainWheel(
          wheelColor: baseColor,
          wheelSize: wheelSize
        ),
        CustomPaint(
          painter: FerrisSupport(
            color: baseColor,
          ),
          child: Container(width: wheelSize / 4, height: wheelSize * 1.5),
        )
      ],
    );
  }
}
