import 'package:flutter/material.dart';

import '../atoms/carriage_support.dart';
// import '../atoms/carriage.dart';

class CarriageSection extends StatelessWidget {

  final double size;
  final Color color;

  CarriageSection({
    @required this.size,
    @required this.color,
  })  : assert(size != null),
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
            height: size,
            width: 50
          )
        )
      ],
    );
  }
}