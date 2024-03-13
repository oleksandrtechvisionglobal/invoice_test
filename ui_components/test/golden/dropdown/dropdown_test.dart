import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_dropdown.dart';

void main() {
  group('Dropdown tests', () {
    testWidgets('Dropdown test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppDropdown(
              items: ['Item 1', 'Item 2', 'Item 3'],
              onChanged: (value) {},
              hintText: 'Select an item',
              initialValue: 'Item 1',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDropdown),
        matchesGoldenFile('snapshots/dropdown.png'),
      );
    });

    testWidgets('Dropdown in dark mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Scaffold(
            body: AppDropdown(
              items: ['Item 1', 'Item 2', 'Item 3'],
              onChanged: (value) {},
              hintText: 'Select an item',
              initialValue: 'Item 1',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDropdown),
        matchesGoldenFile('snapshots/dark_dropdown.png'),
      );
    });
  });
}
