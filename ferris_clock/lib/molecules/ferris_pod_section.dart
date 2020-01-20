import 'package:flutter/material.dart';

import '../atoms/ferris_pod_beam.dart';
import '../atoms/ferris_pod.dart';

class FerrisPodSection extends AnimatedWidget {
  FerrisPodSection({
    @required this.baseColor,
    @required this.beamColor,
    @required this.beamLength,
    this.beamCompletedLength = 0.0,
    @required this.podColor,
    @required this.podHeight,
    @required this.podWidth,
    @required this.angleRadians,
    Key key,
    @required Animation<double> animation
  })  : assert(baseColor != null),
        assert(beamColor != null),
        assert(beamLength != null),
        assert(beamCompletedLength != null),
        assert(podHeight != null),
        assert(podWidth != null),
        super(key: key, listenable: animation);

  final Color baseColor;
  final Color beamColor;
  final double beamLength;
  final double beamCompletedLength;
  final Color podColor;
  final double podHeight;
  final double podWidth;

  final double angleRadians;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final double beamThickness = beamLength * 0.08;

    return Transform.rotate(
      origin: Offset(0, 0),
      angle: angleRadians,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          AnimatedBuilder(
            animation: animation,
            child: FerrisPod(
              height: podHeight,
              width: podWidth,
              color: podColor
            ),
            builder: (BuildContext context, Widget _widget) {
              return Transform.rotate(
                origin: Offset(0, -podHeight / 2.5),
                angle: -angleRadians - animation.value,
                child: _widget
              );
            },
          ),
          FerrisPodBeam(
            color: beamColor,
            baseColor: baseColor,
            length: beamLength,
            completedLength: beamCompletedLength,
            thickness: beamThickness,
          )
        ],
      )
    );
  }
}