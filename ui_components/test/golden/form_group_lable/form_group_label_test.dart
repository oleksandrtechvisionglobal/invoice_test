import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_form_group_label.dart';

void main() {
  group('Form Group Label tests', () {
    testWidgets('Form Group Label test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppFormGroupLabel(
              label: 'Label',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppFormGroupLabel),
        matchesGoldenFile('snapshots/form_group_label.png'),
      );
    });
  });
}
