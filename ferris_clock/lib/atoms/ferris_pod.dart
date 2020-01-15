import 'dart:math' as math;

import 'package:flutter/material.dart';

class FerrisPod extends StatelessWidget {

  final Color color;
  final double height;
  final double width;

  final double angleRadians;

  FerrisPod({
    @required this.color,
    @required this.height,
    @required this.width,
    @required this.angleRadians
  })  : assert(color != null),
        assert(height != null),
        assert(width != null),
        assert(angleRadians != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: _FerrisPodPainter(
            color: color,
            angleRadians: angleRadians
          ),
        ),
      ),
    );
  }
}

class _FerrisPodPainter extends CustomPainter {

  final Color color;
  final double angleRadians;

  Paint _paint;

  _FerrisPodPainter({
    @required this.color,
    @required this.angleRadians
  })  : assert(color != null),
        assert(angleRadians != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height * 0.1);
    canvas.rotate(-angleRadians);
    canvas.translate(-size.width / 2, -size.height * 0.1);

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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}