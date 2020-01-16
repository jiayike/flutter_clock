import 'package:flutter/material.dart';

import '../atoms/ferris_pod_beam.dart';
import '../atoms/ferris_pod.dart';

class FerrisPodSection extends AnimatedWidget {

  final Color color;
  final double beamLength;
  final double podHeight;
  final double podWidth;

  final double angleRadians;

  FerrisPodSection({
    @required this.color,
    @required this.beamLength,
    @required this.podHeight,
    @required this.podWidth,
    @required this.angleRadians,
    Key key,
    @required Animation<double> animation
  })  : assert(color != null),
        assert(beamLength != null),
        assert(podHeight != null),
        assert(podWidth != null),
        super(key: key, listenable: animation);

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
          FerrisPodBeam(
            color: color,
            length: beamLength,
            thickness: beamThickness,
          ),
          AnimatedBuilder(
            animation: animation,
            child: FerrisPod(
              height: podHeight,
              width: podWidth,
              color: color
            ),
            builder: (BuildContext context, Widget _widget) {
              return Transform.rotate(
                origin: Offset(0, -podHeight / 2.5),
                angle: -angleRadians - animation.value,
                child: _widget
              );
            },
          )
        ],
      )
    );
  }
}