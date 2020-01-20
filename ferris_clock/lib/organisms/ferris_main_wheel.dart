import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../atoms/hollow_circle.dart';
import '../molecules/ferris_pod_section.dart';

class FerrisMainWheel extends StatefulWidget {
  FerrisMainWheel({
    @required this.wheelSize,
    @required this.baseColor,
    this.hourColors,
    @required this.hour,
    @required this.minute,
    @required this.second
  })  : assert(wheelSize != null),
        assert(baseColor != null);
      
  final double wheelSize;
  final Color baseColor;
  final List<Color> hourColors;

  final int hour;
  final int minute;
  final int second;

  @override
  _FerrisMainWheelState createState() => new _FerrisMainWheelState();
}

class _FerrisMainWheelState extends State<FerrisMainWheel> with SingleTickerProviderStateMixin {
  final int _innerWheelScale = 2;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    final double initOffset = 360 / 60 * widget.second;

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60)
    );
    animation = Tween<double>(begin: radians(0 + initOffset), end: radians(360 + initOffset)).animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int convertTo12Hour(int value24Hour) {
    return value24Hour % 12;
  }

  Color getBeamColor(int hour, List<Color> colors) {
    final int colorCount = colors.length;

    return colors[hour % colorCount];
  }

  double getBeamLength(int beamValue, int hour, int minute) {
    if (beamValue <= hour) {
      return 1.0;
    } else if (beamValue > hour + 1) {
      return 0.0;
    } else {
      return minute / 60;
    }
  }

  List<Widget> generateFerrisPodSection() {

    List<int> hours = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    final double beamLength = widget.wheelSize;
    final double podHeight = widget.wheelSize * 0.2;
    final double podWidth = podHeight * 0.8;

    return hours.asMap().entries.map((MapEntry entry) {
      final double degreesDiff = 360 / hours.length;
      final double degrees = degreesDiff * entry.key;
      final double angleRadians = radians(degrees);

      final value12Hour = convertTo12Hour(widget.hour);
      final Color beamColor = getBeamColor(entry.value, widget.hourColors);
      
      return FerrisPodSection(
        baseColor: widget.baseColor,
        beamColor: beamColor,
        beamLength: beamLength,
        beamCompletedLength: getBeamLength(entry.value, value12Hour, widget.minute),
        podColor: entry.value <= value12Hour ? beamColor : widget.baseColor,
        podHeight: podHeight,
        podWidth: podWidth,
        angleRadians: angleRadians,
        animation: animation
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double innerWheelSize = widget.wheelSize / _innerWheelScale;

    List<Widget> children = new List();
    children.addAll(generateFerrisPodSection());
    children.add(
      HollowCircle(
        color: widget.baseColor,
        thickness: 2,
        size: innerWheelSize
      )
    );
    children.add(
      HollowCircle(
        color: widget.baseColor,
        thickness: 5,
        size: widget.wheelSize
      )
    );

    return AnimatedBuilder(
      animation: animation,
      child: Stack(
        alignment: Alignment.center,
        children: children
      ),
      builder: (BuildContext context, Widget _widget) {
        return Transform.rotate(
          angle: animation.value,
          child: _widget,
        );
      },
    );
  }
}
