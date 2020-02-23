import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ferris_clock/templates/weather_status.dart';

void main() {
  testWidgets('Weather status smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const temperature = '5';
    const temperatureRange = '(5 - 10)';
    const condition = 'sunny';
    const location = 'Singapore';
    await tester.pumpWidget(ClockCustomizer((ClockModel model) => WeatherStatus(
        temperature: temperature,
        temperatureRange: temperatureRange,
        condition: condition,
        location: location)));

    // Verify that add weather details displayed.
    expect(find.text(temperature), findsOneWidget);
    expect(find.text(temperatureRange), findsOneWidget);
    expect(find.text(condition), findsOneWidget);
    expect(find.text(location), findsOneWidget);
  });
}
