import 'package:ferris_clock/atoms/outline_text.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ferris_clock/templates/digital_clock.dart';

void main() {
  testWidgets('Digital clock 24 hour smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ClockCustomizer((ClockModel model) => DigitalClock(
        now: DateTime(2020, 01, 01, 14, 59, 00), is24HourFormat: true)));

    // Verify that our clock contains 14:59:00.
    expect(find.widgetWithText(OutlineText, '14'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, '59'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, '00'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, 'PM'), findsNothing);
  });

  testWidgets('Digital clock 12 hour smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ClockCustomizer((ClockModel model) => DigitalClock(
        now: DateTime(2020, 01, 01, 14, 59, 00), is24HourFormat: false)));
    await tester.pumpAndSettle();

    // Verify that our clock contains 02:59:00PM.
    expect(find.widgetWithText(OutlineText, '02'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, '59'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, '00'), findsNWidgets(2));
    expect(find.widgetWithText(OutlineText, ' PM'), findsNWidgets(2));
  });
}
