import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';
import '../molecules/ferris_pod_section.dart';

class FerrisMainWheel extends StatelessWidget {

  final double wheelSize;
  final Color wheelColor;

  final int _innerWheelScale = 2;

  FerrisMainWheel({
    @required this.wheelSize,
    @required this.wheelColor
  })  : assert(wheelSize != null),
        assert(wheelColor != null);

  List<Widget> generateCarriageSection() {

    List<int> hours = [1];

    final double beamLength = wheelSize;
    final double podHeight = wheelSize * 0.2;
    final double podWidth = podHeight / 2;

    return hours.map((it) => 
      FerrisPodSection(
        color: wheelColor,
        beamLength: beamLength,
        podHeight: podHeight,
        podWidth: podWidth
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double innerWheelSize = wheelSize / _innerWheelScale;

    List<Widget> children = new List();
    children.addAll(generateCarriageSection());
    children.add(
      HollowCircle(
        color: wheelColor,
        thickness: 5,
        size: wheelSize
      )
    );
    children.add(
      HollowCircle(
        color: wheelColor,
        thickness: 2,
        size: innerWheelSize
      )
    );

    return Stack(
      alignment: Alignment.center,
      children: children
    );
  }
}
