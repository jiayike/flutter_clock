import 'dart:math' as math;

import 'package:flutter/material.dart';

class FerrisPod extends StatelessWidget {
  FerrisPod({
    @required this.color,
    @required this.height,
    @required this.width
  })  : assert(color != null),
        assert(height != null),
        assert(width != null);

  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: _FerrisPodPainter(
            color: color
          ),
        ),
      ),
    );
  }
}

class _FerrisPodPainter extends CustomPainter {
  _FerrisPodPainter({
    @required this.color
  })  : assert(color != null);

  final Color color;

  Paint _paint;
  
  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      _paint,
    );
    canvas.drawRect(
      Rect.fromLTRB(size.width * 0.1, size.height * 0.6, size.width * 0.9, size.height),
      _paint
    );
  }

  @override
  bool shouldRepaint(_FerrisPodPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}