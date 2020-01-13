import 'package:flutter/material.dart';

class FerrisSupport extends CustomPainter {

  final Color color;

  Paint _paint;

  FerrisSupport({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(-size.width / 2, 0);
    canvas.drawPath(getTrianglePath(size.width, size.height), _paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x * 3/4, y * 1/8)
      ..lineTo(x / 2, 0)
      ..quadraticBezierTo(x / 2, 0, x * 1/4, y * 1/8)
      ..lineTo(x * 1/4, y * 1/8)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}