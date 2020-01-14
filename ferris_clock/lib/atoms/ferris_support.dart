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
    canvas.drawPath(getFerrisSupportPath(size.width, size.height), _paint);
  }

  Path getFerrisSupportPath(double x, double y) {
    final Map topLeftCutoff = {
      x: x * 1/4,
      y: y * 1/2
    };
    final Map topRightCutoff = {
      x: x * 3/4,
      y: y * 1/2
    };

    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(topRightCutoff[x], topRightCutoff[y])
      ..quadraticBezierTo(x / 2, y / 2.5, topLeftCutoff[x], topLeftCutoff[y])
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}