import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clock_helper/model.dart';

import '../templates/ferris_clock.dart';
import '../templates/digital_clock.dart';
import '../templates/weather_status.dart';

enum _ClockColors {
  background,
  textColor,
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

final lightTheme = {
  _ClockColors.background: Colors.grey[300],
  _ClockColors.textColor: Colors.grey[700],
  _ClockColors.baseColor: Colors.black26,
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

final darkTheme = {
  _ClockColors.background: Colors.black,
  _ClockColors.textColor: Colors.white70,
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

class Home extends StatefulWidget {
  Home(this.model);

  final ClockModel model;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  var _now = DateTime.now();
  var _temperature = '';
  var _temperatureRange = '';
  var _condition = '';
  var _location = '';
  Timer _timer;

  final String _fontFamily = 'Alata';

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperatureString;
      _temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
      _condition = widget.model.weatherString;
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double wheelSize = deviceHeight / 1.5;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final customTheme = isDarkMode ? darkTheme : lightTheme;

    final hourColors = [
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
    ];

    return Semantics.fromProperties(
        properties: SemanticsProperties(
          label: 'Flutter clock with time $time',
          value: time,
        ),
        child: Container(
            color: customTheme[_ClockColors.background],
            child: Stack(children: <Widget>[
              Container(),
              Positioned(
                  left: wheelSize / 4,
                  bottom: 0,
                  child: FerrisClock(
                      now: _now,
                      wheelSize: wheelSize,
                      baseColor: customTheme[_ClockColors.baseColor],
                      hourColors: hourColors)),
              Positioned(
                  right: wheelSize / 10,
                  bottom: deviceHeight / 20,
                  child: DigitalClock(
                      now: _now,
                      hourColors: hourColors,
                      is24HourFormat: widget.model.is24HourFormat,
                      fontFamily: _fontFamily,
                      borderColor: isDarkMode
                          ? null
                          : customTheme[_ClockColors.textColor])),
              Positioned(
                  right: wheelSize / 10,
                  top: deviceHeight / 20,
                  child: WeatherStatus(
                      temperature: _temperature,
                      temperatureRange: _temperatureRange,
                      condition: _condition,
                      location: _location,
                      color: customTheme[_ClockColors.textColor],
                      fontFamily: _fontFamily))
            ])));
  }
}
