import 'package:flutter/material.dart';

import '../atoms/ferris_support.dart';
import '../molecules/main_wheel.dart';

class FerrisClock extends StatelessWidget {

  final Color color;

  FerrisClock({
    @required this.color
  })  : assert(color != null);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double wheelSize = deviceHeight / 1.8;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        MainWheel(
          color: color,
          wheelSize: wheelSize
        ),
        CustomPaint(
          painter: FerrisSupport(
            color: color,
          ),
          child: Container(width: wheelSize / 4, height: wheelSize * 1.5),
        )
      ],
    );
  }
}
