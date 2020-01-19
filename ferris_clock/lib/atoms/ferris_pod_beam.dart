import 'package:flutter/material.dart';

class FerrisPodBeam extends StatelessWidget {
  FerrisPodBeam({
    @required this.color,
    @required this.length,
    @required this.thickness,
  })  : assert(color != null),
        assert(length != null),
        assert(thickness != null);

  final Color color;
  final double length;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: length,
        width: thickness,
        child: CustomPaint(
          painter: _FerrisPodBeamPainter(
            color: color,
          ),
        ),
      ),
    );
  }
}

class _FerrisPodBeamPainter extends CustomPainter {

  final Color color;

  Paint _paint;

  _FerrisPodBeamPainter({
    @required this.color
  })  : assert(color != null);

  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    canvas.drawPath(getFerrisPodBeamPath(size.width, size.height), _paint);
  }

  Path getFerrisPodBeamPath(double x, double y) {
    return Path()
      ..moveTo(x / 2, y / 2)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(_FerrisPodBeamPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}