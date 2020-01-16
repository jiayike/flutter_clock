import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import '../templates/clock.dart';

class Home extends StatelessWidget {
  Home(this.model);

  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    final Color wheelColor = Theme.of(context).disabledColor;

    return Clock(
      baseColor: wheelColor,
      model: model
    );
  }
}
