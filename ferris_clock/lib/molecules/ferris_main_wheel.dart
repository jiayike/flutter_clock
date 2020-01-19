import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../atoms/hollow_circle.dart';
import '../molecules/ferris_pod_section.dart';

class FerrisMainWheel extends StatefulWidget {
  FerrisMainWheel({
    @required this.wheelSize,
    @required this.baseColor,
    @required this.hour,
    @required this.minute,
    @required this.second
  })  : assert(wheelSize != null),
        assert(baseColor != null);
      
  final double wheelSize;
  final Color baseColor;

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
    controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 60)
    );
    animation = Tween<double>(begin: 0, end: radians(360)).animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> generateFerrisPodSection() {

    List<int> hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double beamLength = widget.wheelSize;
    final double podHeight = widget.wheelSize * 0.2;
    final double podWidth = podHeight * 0.8;

    return hours.asMap().entries.map((MapEntry entry) {
      final degreesDiff = 360 / hours.length;
      final degrees = degreesDiff * entry.key;
      final double angleRadians = radians(degrees);
      
      return FerrisPodSection(
        color: widget.baseColor,
        beamLength: beamLength,
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
        thickness: 5,
        size: widget.wheelSize
      )
    );
    children.add(
      HollowCircle(
        color: widget.baseColor,
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
