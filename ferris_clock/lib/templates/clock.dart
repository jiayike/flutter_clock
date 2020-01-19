import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clock_helper/model.dart';

import '../organisms/ferris_clock.dart';

class Clock extends StatefulWidget {
  Clock({
    @required this.baseColor,
    this.model
  })  : assert(baseColor != null);

  final Color baseColor;
  final ClockModel model;

  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<Clock> {
  var _now = DateTime.now();
  var _temperature = '';
  var _temperatureRange = '';
  var _condition = '';
  var _location = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(Clock oldWidget) {
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
    // setState(() {
    //   _temperature = widget.model.temperatureString;
    //   _temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
    //   _condition = widget.model.weatherString;
    //   _location = widget.model.location;
    // });
  }

  void _updateTime() {
    // setState(() {
    //   _now = DateTime.now();
    //   // Update once per second. Make sure to do it at the beginning of each
    //   // new second, so that the clock is accurate.
    //   _timer = Timer(
    //     Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
    //     _updateTime,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    final double deviceHeight = MediaQuery.of(context).size.height;
    // final double deviceWidth = MediaQuery.of(context).size.width;
    final double wheelSize = deviceHeight / 1.5;

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Flutter clock with time $time',
        value: time,
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(),
            Positioned(
              left: wheelSize / 4,
              bottom: 0,
              child: FerrisClock(
                baseColor: widget.baseColor,
                wheelSize: wheelSize,
                hour: _now.hour,
                minute: _now.minute,
                second: _now.second,
              )
            )
          ]
        )
      )
    );
  }
}
