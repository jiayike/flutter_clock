import 'package:flutter/material.dart';

import '../atoms/ferris_support.dart';
import '../molecules/ferris_main_wheel.dart';

class FerrisClock extends StatelessWidget {
  FerrisClock({
    @required this.baseColor,
    this.hourColors,
    @required this.wheelSize,
    this.hour,
    this.minute,
    this.second
  })  : assert(baseColor != null),
        assert(wheelSize != null),
        assert(hour != null),
        assert(minute != null),
        assert(second != null);

  final Color baseColor;
  final List<Color> hourColors;
  final double wheelSize;

  final int hour;
  final int minute;
  final int second;

  @override
  Widget build(BuildContext context) {
    final double ferrisSupportHeight = wheelSize * 1.5;
    final double ferrisSupportWidth = wheelSize / 5;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        FerrisMainWheel(
          baseColor: baseColor,
          hourColors: hourColors,
          wheelSize: wheelSize,
          hour: hour,
          minute: minute,
          second: second,
        ),
        FerrisSupport(
          color: baseColor,
          height: ferrisSupportHeight,
          width: ferrisSupportWidth
        )
      ],
    );
  }
}
