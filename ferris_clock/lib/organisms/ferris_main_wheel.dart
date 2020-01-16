import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../atoms/hollow_circle.dart';
import '../molecules/ferris_pod_section.dart';

class FerrisMainWheel extends StatefulWidget {

  final double wheelSize;
  final Color wheelColor;

  FerrisMainWheel({
    @required this.wheelSize,
    @required this.wheelColor
  })  : assert(wheelSize != null),
        assert(wheelColor != null);

  @override
  _FerrisMainWheelState createState() => new _FerrisMainWheelState(wheelSize: wheelSize, wheelColor: wheelColor);
}

class _FerrisMainWheelState extends State<FerrisMainWheel> with SingleTickerProviderStateMixin {
  _FerrisMainWheelState({
    @required this.wheelSize,
    @required this.wheelColor
  })  : assert(wheelSize != null),
        assert(wheelColor != null);

  final double wheelSize;
  final Color wheelColor;

  final int _innerWheelScale = 2;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 60)
    );
    animation = Tween<double>(begin: 0, end: convertDegreesToRadians(360)).animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double convertDegreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  List<Widget> generateFerrisPodSection() {

    List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double beamLength = wheelSize;
    final double podHeight = wheelSize * 0.2;
    final double podWidth = podHeight * 0.8;

    return hours.asMap().entries.map((MapEntry entry) {
      final degreesDiff = 360 / hours.length;
      final degrees = degreesDiff * entry.key;
      final double radians = convertDegreesToRadians(degrees);
      
      return FerrisPodSection(
        color: wheelColor,
        beamLength: beamLength,
        podHeight: podHeight,
        podWidth: podWidth,
        angleRadians: radians,
        animation: animation
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double innerWheelSize = wheelSize / _innerWheelScale;

    List<Widget> children = new List();
    children.addAll(generateFerrisPodSection());
    children.add(
      HollowCircle(
        color: wheelColor,
        thickness: 5,
        size: wheelSize
      )
    );
    children.add(
      HollowCircle(
        color: wheelColor,
        thickness: 2,
        size: innerWheelSize
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
