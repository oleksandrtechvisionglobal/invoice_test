import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_date_picker.dart';

void main() {
  group('Date picker tests', () {
    testWidgets('Date picker test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppDatePicker(
              hintText: 'Date',
              initialDate: DateTime(12, 12, 2024),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDatePicker),
        matchesGoldenFile('snapshots/date_picker.png'),
      );
    });

    testWidgets('Date picker in dark mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Scaffold(
            body: AppDatePicker(
              hintText: 'Date',
              initialDate: DateTime(12, 12, 2024),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDatePicker),
        matchesGoldenFile('snapshots/dark_date_picker.png'),
      );
    });
  });
}
