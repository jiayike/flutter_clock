import 'package:flutter/material.dart';

class Carriage extends CustomPainter {

  final Color color;

  Paint _paint;

  Carriage({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    assert(size.aspectRatio == 0.5);
    canvas.drawPath(getCarriagePath(size.width, size.height), _paint);
  }

  Path getCarriagePath(double x, double y) {
    return Path()
      ..moveTo(x, y)
      ..lineTo(0, y)
      ..lineTo(x, 0)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}