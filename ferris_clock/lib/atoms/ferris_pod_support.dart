import 'package:flutter/material.dart';

class FerrisPodSupport extends StatelessWidget {

  final Color color;
  final double height;
  final double width;

  FerrisPodSupport({
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
          painter: _FerrisPodSupportPainter(
            color: color,
          ),
        ),
      ),
    );
  }
}

class _FerrisPodSupportPainter extends CustomPainter {

  final Color color;

  Paint _paint;

  _FerrisPodSupportPainter({
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