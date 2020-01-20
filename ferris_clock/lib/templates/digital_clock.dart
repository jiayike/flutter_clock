// // Copyright 2019 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// import 'dart:async';

// import 'package:flutter_clock_helper/model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// /// A basic digital clock.
// ///
// /// You can do better than this!
// class DigitalClock extends StatelessWidget {
//   const DigitalClock();

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).brightness == Brightness.light
//         ? _lightTheme
//         : _darkTheme;
//     final hour =
//         DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
//     final minute = DateFormat('mm').format(_dateTime);
//     final fontSize = MediaQuery.of(context).size.width / 3.5;
//     final offset = -fontSize / 7;
//     final defaultStyle = TextStyle(
//       color: colors[_Element.text],
//       fontFamily: 'PressStart2P',
//       fontSize: fontSize,
//       shadows: [
//         Shadow(
//           blurRadius: 0,
//           color: colors[_Element.shadow],
//           offset: Offset(10, 0),
//         ),
//       ],
//     );

//     return Container(
//       color: colors[_Element.background],
//       child: Center(
//         child: DefaultTextStyle(
//           style: defaultStyle,
//           child: Stack(
//             children: <Widget>[
//               Positioned(left: offset, top: 0, child: Text(hour)),
//               Positioned(right: offset, bottom: offset, child: Text(minute)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
