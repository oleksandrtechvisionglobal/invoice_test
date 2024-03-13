import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_calendar.dart';

void main() {
  group('Calendar tests', () {
    testWidgets('Calendar test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: Calendar(
              initialDate: DateTime(12, 12, 2024),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Calendar),
        matchesGoldenFile('snapshots/calendar.png'),
      );
    });

    testWidgets('Calendar in dark mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Scaffold(
            body: Calendar(
              initialDate: DateTime(12, 12, 2024),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Calendar),
        matchesGoldenFile('snapshots/dark_calendar.png'),
      );
    });
  });
}
