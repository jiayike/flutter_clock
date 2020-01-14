import 'package:flutter/material.dart';

class HollowCircle extends StatelessWidget {

  final Color color;
  final double thickness;
  final double size;

  HollowCircle({
    @required this.color,
    @required this.thickness,
    @required this.size
  })  : assert(color != null),
        assert(thickness != null),
        assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CustomPaint(
          painter: _HollowCirclePainter(
            color: color,
            strokeWidth: thickness,
            radius: size / 2
          ),
        ),
      ),
    );
  }
}

class _HollowCirclePainter extends CustomPainter {

  final Color color;
  final double strokeWidth;
  final double radius;

  Paint _paint;

  _HollowCirclePainter({
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
    canvas.drawCircle(Offset(radius, radius), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}