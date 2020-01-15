import 'package:flutter/material.dart';

import '../atoms/ferris_pod_beam.dart';
import '../atoms/ferris_pod.dart';

class FerrisPodSection extends StatelessWidget {

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
    @required this.angleRadians
  })  : assert(color != null),
        assert(beamLength != null),
        assert(podHeight != null),
        assert(podWidth != null);

  @override
  Widget build(BuildContext context) {
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
          FerrisPod(
            height: podHeight,
            width: podWidth,
            color: color,
            angleRadians: angleRadians
          )
        ],
      )
    );
  }
}