import 'package:flutter/material.dart';

class HollowCircle extends StatelessWidget {
  HollowCircle(
      {@required this.color, @required this.thickness, @required this.size})
      : assert(color != null),
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
          painter: _HollowCirclePainter(color: color, strokeWidth: thickness),
        ),
      ),
    );
  }
}

class _HollowCirclePainter extends CustomPainter {
  _HollowCirclePainter({
    @required this.color,
    @required this.strokeWidth,
  })  : assert(color != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;

  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(radius, radius), radius, _paint);
  }

  @override
  bool shouldRepaint(_HollowCirclePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
