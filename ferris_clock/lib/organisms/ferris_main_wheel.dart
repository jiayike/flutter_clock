import 'dart:math' as math;

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

  List<Widget> generateFerrisPodSection() {

    List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double beamLength = wheelSize;
    final double podHeight = wheelSize * 0.2;
    final double podWidth = podHeight * 0.8;

    return hours.asMap().entries.map((MapEntry entry) {
      final degreesDiff = 360 / hours.length;
      final degrees = degreesDiff * entry.key;
      final double radians = degrees * math.pi / 180;
      
      return FerrisPodSection(
        color: wheelColor,
        beamLength: beamLength,
        podHeight: podHeight,
        podWidth: podWidth,
        angleRadians: radians
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double innerWheelSize = wheelSize / _innerWheelScale;

    List<Widget> children = new List();
    children.addAll(generateFerrisPodSection());
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
