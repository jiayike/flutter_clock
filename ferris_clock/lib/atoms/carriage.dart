import 'package:flutter/material.dart';

class Carriage extends StatelessWidget {

  final Color color;
  final double wheelSize;

  Carriage({
    @required this.color,
    @required this.wheelSize
  })  : assert(color != null),
        assert(wheelSize != null);

  @override
  Widget build(BuildContext context) {
    final double width = wheelSize * 0.1;
    final height = width * 2;

    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: _CarriagePainter(
            color: color,
          ),
        ),
      ),
    );
  }
}

class _CarriagePainter extends CustomPainter {

  final Color color;

  Paint _paint;

  _CarriagePainter({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getCarriagePath(size.width, size.height), _paint);
  }

  Path getCarriagePath(double x, double y) {
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