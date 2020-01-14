import 'package:flutter/material.dart';

import '../atoms/ferris_support.dart';
import '../organisms/ferris_main_wheel.dart';

class FerrisClock extends StatelessWidget {

  final Color baseColor;

  FerrisClock({
    @required this.baseColor
  })  : assert(baseColor != null);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double wheelSize = deviceHeight / 1.8;

    final double ferrisSupportHeight = wheelSize * 1.5;
    final double ferrisSupportWidth = wheelSize / 5;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        FerrisMainWheel(
          wheelColor: baseColor,
          wheelSize: wheelSize
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
