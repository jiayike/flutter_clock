import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import '../templates/clock.dart';

enum _ClockColors {
  background,
  baseColor,
  hourColor1,
  hourColor2,
  hourColor3,
  hourColor4,
  hourColor5,
  hourColor6,
  hourColor7,
  hourColor8,
  hourColor9,
  hourColor10,
  hourColor11,
  hourColor12
}

final _lightTheme = {
  _ClockColors.background: Colors.white,
  _ClockColors.baseColor: Colors.black38,
  _ClockColors.hourColor1: Color(0xFFFF9AA2),
  _ClockColors.hourColor2: Color(0xFFFFB7B2),
  _ClockColors.hourColor3: Color(0xFFFFDAC1),
  _ClockColors.hourColor4: Color(0xFFE2F0CB),
  _ClockColors.hourColor5: Color(0xFFB5EAD7),
  _ClockColors.hourColor6: Color(0xFFCAFFBE),
  _ClockColors.hourColor7: Color(0xFFC7CEEA),
  _ClockColors.hourColor8: Color(0xFFD5B9FC),
  _ClockColors.hourColor9: Color(0xFFFCCDF9),
  _ClockColors.hourColor10: Color(0xFFC3E9FF),
  _ClockColors.hourColor11: Color(0xFFBEFFFD),
  _ClockColors.hourColor12: Color(0xFFFFFCC3)
};

final _darkTheme = {
  _ClockColors.background: Colors.black,
  _ClockColors.baseColor: Colors.white24,
  _ClockColors.hourColor1: Color(0xFFFF9AA2),
  _ClockColors.hourColor2: Color(0xFFFFB7B2),
  _ClockColors.hourColor3: Color(0xFFFFDAC1),
  _ClockColors.hourColor4: Color(0xFFE2F0CB),
  _ClockColors.hourColor5: Color(0xFFB5EAD7),
  _ClockColors.hourColor6: Color(0xFFCAFFBE),
  _ClockColors.hourColor7: Color(0xFFC7CEEA),
  _ClockColors.hourColor8: Color(0xFFD5B9FC),
  _ClockColors.hourColor9: Color(0xFFFCCDF9),
  _ClockColors.hourColor10: Color(0xFFC3E9FF),
  _ClockColors.hourColor11: Color(0xFFBEFFFD),
  _ClockColors.hourColor12: Color(0xFFFFFCC3)
};

class Home extends StatelessWidget {
  Home(this.model);

  final ClockModel model;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final customTheme = isDarkMode ? _darkTheme : _lightTheme;

    return Clock(
      baseColor: customTheme[_ClockColors.baseColor],
      hourColors: [
        customTheme[_ClockColors.hourColor1],
        customTheme[_ClockColors.hourColor2],
        customTheme[_ClockColors.hourColor3],
        customTheme[_ClockColors.hourColor4],
        customTheme[_ClockColors.hourColor5],
        customTheme[_ClockColors.hourColor6],
        customTheme[_ClockColors.hourColor7],
        customTheme[_ClockColors.hourColor8],
        customTheme[_ClockColors.hourColor9],
        customTheme[_ClockColors.hourColor10],
        customTheme[_ClockColors.hourColor11],
        customTheme[_ClockColors.hourColor12]
      ],
      model: model
    );
  }
}
