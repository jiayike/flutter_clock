import 'package:flutter/material.dart';

class HollowCircle extends StatelessWidget {
  HollowCircle({
    @required this.color,
    @required this.thickness,
    @required this.size
  })  : assert(color != null),
        assert(thickness != null),
        assert(size != null);

  final Color color;
  final double thickness;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CustomPaint(
          painter: _HollowCirclePainter(
            color: color,
            strokeWidth: thickness
          ),
        ),
      ),
    );
  }
}

class _HollowCirclePainter extends CustomPainter {

  final Color color;
  final double strokeWidth;

  Paint _paint;

  _HollowCirclePainter({
    @required this.color,
    @required this.strokeWidth,
  })  : assert(color != null),
        assert(strokeWidth != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    canvas.drawCircle(Offset(radius, radius), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}