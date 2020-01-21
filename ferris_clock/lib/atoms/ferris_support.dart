import 'package:flutter/material.dart';

class FerrisSupport extends StatelessWidget {
  FerrisSupport(
      {@required this.color, @required this.height, @required this.width})
      : assert(color != null),
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
          painter: _FerrisSupportPainter(color: color),
        ),
      ),
    );
  }
}

class _FerrisSupportPainter extends CustomPainter {
  _FerrisSupportPainter({@required this.color}) : assert(color != null);

  final Color color;

  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    canvas.drawPath(getFerrisSupportPath(size.width, size.height), _paint);
  }

  Path getFerrisSupportPath(double x, double y) {
    final Map topLeftCutoff = {x: x * 1 / 4, y: y * 1 / 2};
    final Map topRightCutoff = {x: x * 3 / 4, y: y * 1 / 2};

    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(topRightCutoff[x], topRightCutoff[y])
      ..quadraticBezierTo(x / 2, y / 2.5, topLeftCutoff[x], topLeftCutoff[y])
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(_FerrisSupportPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
