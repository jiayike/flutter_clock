import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import '../templates/ferris_clock.dart';

class Home extends StatelessWidget {
  Home(this.model);

  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    final Color wheelColor = Theme.of(context).disabledColor;

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50,
            bottom: 0,
            child: FerrisClock(
              baseColor: wheelColor,
            )
          )
        ]
      )
    );
  }
}
