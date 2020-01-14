import 'package:flutter/material.dart';

import '../atoms/carriage_support.dart';
import '../atoms/carriage.dart';

class CarriageSection extends StatelessWidget {

  final double wheelSize;
  final Color color;

  CarriageSection({
    @required this.wheelSize,
    @required this.color,
  })  : assert(wheelSize != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(
          painter: CarriageSupport(
            color: color
          ),
          child: Container(
            height: wheelSize,
            width: 50
          )
        ),
        Carriage(
          wheelSize: wheelSize,
          color: color
        )
      ],
    );
  }
}