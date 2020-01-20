import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  OutlineText({
    @required this.text,
    this.style,
    this.textColor = Colors.black,
    this.borderColor,
  }) : assert(text != null);

  final String text;
  final TextStyle style;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final TextStyle effectiveTextStyle = defaultTextStyle.style.merge(style);
    TextStyle borderStyle;

    if (borderColor != null) {
      borderStyle = effectiveTextStyle.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = borderColor);
    } else {
      borderStyle = effectiveTextStyle;
    }

    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: borderStyle,
        ),
        // Solid text as fill.
        Text(
          text,
          style: effectiveTextStyle,
        ),
      ],
    );
  }
}
