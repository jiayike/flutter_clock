import 'package:flutter/material.dart';

class CarriageSupport extends StatelessWidget {

  final Color color;
  final double height;
  final double width;

  CarriageSupport({
    @required this.color,
    @required this.height,
    @required this.width,
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
          painter: _CarriageSupportPainter(
            color: color,
          ),
        ),
      ),
    );
  }
}

class _CarriageSupportPainter extends CustomPainter {

  final Color color;

  Paint _paint;

  _CarriageSupportPainter({
    @required this.color
  })  : assert(color != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getCarriageSupportPath(size.width, size.height), _paint);
  }

  Path getCarriageSupportPath(double x, double y) {
    return Path()
      ..moveTo(x / 2, y / 2)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}