import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';
import '../molecules/ferris_pod_section.dart';

class MainWheel extends StatelessWidget {

  final double wheelSize;
  final Color wheelColor;

  final int _innerWheelScale = 2;

  MainWheel({
    @required this.wheelSize,
    @required this.wheelColor
  })  : assert(wheelSize != null),
        assert(wheelColor != null);

  List<Widget> generateCarriageSection() {
    List<int> hours = [1];
    return hours.map((it) => 
      FerrisPodSection(
        wheelSize: wheelSize,
        color: wheelColor,
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
        thickness: 15,
        size: wheelSize
      )
    );
    children.add(
      HollowCircle(
        color: wheelColor,
        thickness: 15,
        size: innerWheelSize
      )
    );

    return Stack(
      alignment: Alignment.center,
      children: children
    );
  }
}
