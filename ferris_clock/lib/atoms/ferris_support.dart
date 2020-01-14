import 'package:flutter/material.dart';

class FerrisSupport extends StatelessWidget {

  final Color color;
  final double wheelSize;

  FerrisSupport({
    @required this.color,
    @required this.wheelSize
  })  : assert(color != null),
        assert(wheelSize != null);

  @override
  Widget build(BuildContext context) {
    final double height = wheelSize * 1.5;
    final double width = wheelSize / 4;

    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: _FerrisSupportPainter(
            color: color,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}

class _FerrisSupportPainter extends CustomPainter {

  final Color color;
  final double height;
  final double width;

  Paint _paint;

  _FerrisSupportPainter({
    @required this.color,
    @required this.height,
    @required this.width,
  })  : assert(color != null),
        assert(height != null),
        assert(width != null) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getFerrisSupportPath(size.width, size.height), _paint);
  }

  Path getFerrisSupportPath(double x, double y) {
    final Map topLeftCutoff = {
      x: x * 1/4,
      y: y * 1/2
    };
    final Map topRightCutoff = {
      x: x * 3/4,
      y: y * 1/2
    };

    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(topRightCutoff[x], topRightCutoff[y])
      ..quadraticBezierTo(x / 2, y / 2.5, topLeftCutoff[x], topLeftCutoff[y])
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}