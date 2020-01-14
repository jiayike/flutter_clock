import 'package:flutter/material.dart';

class FerrisPod extends StatelessWidget {

  final Color color;
  final double height;
  final double width;

  FerrisPod({
    @required this.color,
    @required this.height,
    @required this.width
  })  : assert(color != null),
        assert(height != null),
        assert(width != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: _FerrisPodPainter(
            color: color,
          ),
        ),
      ),
    );
  }
}

class _FerrisPodPainter extends CustomPainter {

  final Color color;

  Paint _paint;

  _FerrisPodPainter({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getPodPath(size.width, size.height), _paint);
  }

  Path getPodPath(double x, double y) {
    return Path()
      ..moveTo(x, y)
      ..lineTo(0, y)
      ..lineTo(x, 0)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}