import 'package:flutter/material.dart';

import '../molecules/main_wheel.dart';

class FerrisClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MainWheel()
      ],
    );
  }
}
