import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    @required this.now,
    this.hourColors,
    this.is24HourFormat = false,
    this.fontFamily,
  }) : assert(now != null);

  final DateTime now;
  final List<Color> hourColors;
  final bool is24HourFormat;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    final color = hourColors[now.hour % hourColors.length];
    final hour = DateFormat(is24HourFormat ? 'HH' : 'hh').format(now);
    final minute = DateFormat('mm').format(now);
    final second = DateFormat('ss').format(now);
    final fontSize = MediaQuery.of(context).size.width / 20;
    final secondFontSize = fontSize / 3;

    final defaultStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = color,
    );

    return Center(
      child: Column(children: <Widget>[
        DefaultTextStyle(
          style: defaultStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(hour),
              Opacity(
                opacity: now.second % 2 == 1 ? 0.0 : 1.0,
                child: Text(':'),
              ),
              Text(minute),
            ],
          ),
        ),
        DefaultTextStyle(
            style: defaultStyle.copyWith(fontSize: secondFontSize),
            child: Text(second))
      ]),
    );
  }
}
