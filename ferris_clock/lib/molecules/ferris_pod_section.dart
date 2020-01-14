import 'package:flutter/material.dart';

import '../atoms/ferris_pod_support.dart';
import '../atoms/ferris_pod.dart';

class FerrisPodSection extends StatelessWidget {

  final double wheelSize;
  final Color color;

  FerrisPodSection({
    @required this.wheelSize,
    @required this.color,
  })  : assert(wheelSize != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FerrisPodSupport(
          color: color,
          height: wheelSize,
          width: wheelSize / 10
        ),
        Transform.translate(
          offset: Offset(0, -wheelSize / 10),
          child: FerrisPod(
            wheelSize: wheelSize,
            color: color
          )
        )
      ],
    );
  }
}