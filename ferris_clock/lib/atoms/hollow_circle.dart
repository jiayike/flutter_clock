import 'package:flutter/material.dart';

class HollowCircle extends CustomPainter {

  final Color color;
  final double strokeWidth;

  Paint _paint;

  HollowCircle({
    @required this.color,
    @required this.strokeWidth
  })  : assert(color != null),
        assert(strokeWidth != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.height == size.width); // Child has to be square
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.height / 2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}