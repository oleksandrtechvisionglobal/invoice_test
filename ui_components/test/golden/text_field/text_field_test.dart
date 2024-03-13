import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_text_field.dart';

void main() {
  group('Text Field tests', () {
    testWidgets('Text Field test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppTextField(
              hintText: 'Hint',
              onChanged: (value) {},
              controller: TextEditingController(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppTextField),
        matchesGoldenFile('snapshots/text_field.png'),
      );
    });

    testWidgets('Text field in dark test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Scaffold(
            body: AppTextField(
              hintText: 'Hint',
              onChanged: (value) {},
              controller: TextEditingController(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppTextField),
        matchesGoldenFile('snapshots/dark_text_field.png'),
      );
    });
  });
}
