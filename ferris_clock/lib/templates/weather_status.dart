import 'package:flutter/material.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus(
      {@required this.temperature,
      @required this.temperatureRange,
      @required this.condition,
      @required this.location,
      this.color,
      this.fontFamily})
      : assert(temperature != null),
        assert(temperatureRange != null),
        assert(condition != null),
        assert(location != null);

  final String temperature;
  final String temperatureRange;
  final String condition;
  final String location;
  final Color color;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: color, fontFamily: fontFamily),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(temperature),
          Text(temperatureRange),
          Text(condition),
          Text(location),
        ],
      ),
    );
  }
}
