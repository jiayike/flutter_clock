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
  })  : assert(color != null) {
    _border = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
  }

  final Color color;

  Paint _paint;
  Paint _border;

  void paintPodTop(Canvas canvas, Size size, bool useCenter, Paint paint) {
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      useCenter,
      paint,
    );
  }

  void paintPodBottom(Canvas canvas, Size size, Paint paint) {
    canvas.drawRect(
      Rect.fromLTRB(size.width * 0.1, size.height * 0.6, size.width * 0.9, size.height),
      paint
    );
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    paintPodTop(canvas, size, false, _paint);
    paintPodTop(canvas, size, true, _border);

    paintPodBottom(canvas, size, _paint);
    paintPodBottom(canvas, size, _border);
  }

  @override
  bool shouldRepaint(_FerrisPodPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}