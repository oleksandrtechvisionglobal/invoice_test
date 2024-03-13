import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_divider.dart';

void main() {
  group('Divider test', () {
    testWidgets('Divider test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppDivider(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDivider),
        matchesGoldenFile('snapshots/divider.png'),
      );
    });

    testWidgets('Divider in dark mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Scaffold(
            body: AppDivider(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppDivider),
        matchesGoldenFile('snapshots/dark_divider.png'),
      );
    });
  });
}
