import 'package:flutter/material.dart';

class HollowCircle extends CustomPainter {

  final Color color;
  final double strokeWidth;
  final double radius;

  Paint _paint;

  HollowCircle({
    @required this.color,
    @required this.strokeWidth,
    @required this.radius
  })  : assert(color != null),
        assert(strokeWidth != null),
        assert(radius != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), this.radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}