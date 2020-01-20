import 'package:flutter/material.dart';

class FerrisPodBeam extends StatelessWidget {
  FerrisPodBeam({
    @required this.color,
    @required this.baseColor,
    @required this.length,
    @required this.completedLength,
    @required this.thickness,
  })  : assert(color != null),
        assert(length != null),
        assert(completedLength != null),
        assert(thickness != null);

  final Color color;
  final Color baseColor;
  final double length;
  final double completedLength;
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
            baseColor: baseColor,
            completedLength: completedLength
          ),
        ),
      ),
    );
  }
}

class _FerrisPodBeamPainter extends CustomPainter {

  final Color color;
  final Color baseColor;
  final double completedLength;

  Paint _paint;

  _FerrisPodBeamPainter({
    @required this.color,
    @required this.baseColor,
    @required this.completedLength
  })  : assert(color != null),
        assert(baseColor != null),
        assert(completedLength != null);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Gradient gradient = LinearGradient(
      colors: <Color>[
        color.withOpacity(0.3),
        color.withOpacity(completedLength),
        baseColor,
        baseColor
      ],
      stops: [
        0.0,
        completedLength,
        completedLength,
        1.0
      ],
      begin: Alignment.center,
      end: Alignment.topCenter
    );

     _paint = Paint()
      ..strokeWidth = 1
      ..shader = gradient.createShader(rect)
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