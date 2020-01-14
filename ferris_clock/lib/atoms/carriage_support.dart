import 'package:flutter/material.dart';

class CarriageSupport extends CustomPainter {

  final Color color;

  Paint _paint;

  CarriageSupport({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getCarriageSupportPath(size.width, size.height), _paint);
  }

  Path getCarriageSupportPath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x, y * 0.8)
      ..lineTo(x, y * 0.2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}