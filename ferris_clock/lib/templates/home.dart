import 'package:flutter/material.dart';

import '../organisms/ferris_clock.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        left: 50,
        bottom: 0,
        child: FerrisClock()
      )
    ]);
  }
}
