import 'package:flutter/material.dart';

import '../atoms/ferris_support.dart';
import '../organisms/ferris_main_wheel.dart';

class FerrisClock extends StatelessWidget {
  FerrisClock(
      {@required this.now,
      @required this.wheelSize,
      @required this.baseColor,
      this.hourColors})
      : assert(baseColor != null),
        assert(wheelSize != null),
        assert(now != null);

  final DateTime now;
  final double wheelSize;
  final Color baseColor;
  final List<Color> hourColors;

  @override
  Widget build(BuildContext context) {
    final double ferrisSupportHeight = wheelSize * 1.5;
    final double ferrisSupportWidth = wheelSize / 5;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        FerrisSupport(
            color: baseColor,
            height: ferrisSupportHeight,
            width: ferrisSupportWidth),
        FerrisMainWheel(
          baseColor: baseColor,
          hourColors: hourColors,
          wheelSize: wheelSize,
          hour: now.hour,
          minute: now.minute,
          second: now.second,
        )
      ],
    );
  }
}
