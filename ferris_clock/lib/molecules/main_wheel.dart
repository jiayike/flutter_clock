import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';

class MainWheel extends StatelessWidget {

  final double wheelSize;
  final Color color;

  final int _innerWheelScale = 2;

  MainWheel({
    @required this.wheelSize,
    @required this.color
  })  : assert(wheelSize != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    final double innerWheelSize = wheelSize / _innerWheelScale;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          painter: HollowCircle(
            color: color,
            strokeWidth: 15
          ),
          child: Container(height: wheelSize, width: wheelSize)
        ),
        CustomPaint(
          painter: HollowCircle(
            color: color,
            strokeWidth: 15,
          ),
          child: Container(height: innerWheelSize, width: innerWheelSize)
        )
      ],
    );
  }
}
