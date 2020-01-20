import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../atoms/outline_text.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock(
      {@required this.now,
      this.hourColors,
      this.is24HourFormat = false,
      this.fontFamily,
      this.borderColor})
      : assert(now != null);

  final DateTime now;
  final List<Color> hourColors;
  final bool is24HourFormat;
  final String fontFamily;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final color = hourColors[now.hour % hourColors.length];
    final hour = DateFormat(is24HourFormat ? 'HH' : 'hh').format(now);
    final minute = DateFormat('mm').format(now);
    final second = DateFormat('ss').format(now);
    final amPm = now.hour < 12 ? 'AM' : 'PM';

    final fontSize = MediaQuery.of(context).size.width / 20;
    final secondFontSize = fontSize / 3;

    final defaultStyle =
        TextStyle(color: color, fontFamily: fontFamily, fontSize: fontSize);

    return Center(
        child: DefaultTextStyle(
        style: defaultStyle,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OutlineText(text: hour, borderColor: borderColor),
                    OutlineText(text: ':', borderColor: borderColor),
                    OutlineText(text: minute, borderColor: borderColor),
                  ],
                ),
                OutlineText(
                  text: second,
                  style: defaultStyle.copyWith(fontSize: secondFontSize),
                  borderColor: borderColor
                )
              ]
            ),
            Opacity(
              opacity: is24HourFormat ? 0.0 : 1.0,
              child: OutlineText(
                text: ' ' + amPm,
                style: defaultStyle.copyWith(fontSize: secondFontSize),
                borderColor: borderColor
              )
            ),
          ]
        )
      )
    );
  }
}
