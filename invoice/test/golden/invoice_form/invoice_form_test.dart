import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/pages/edit_invoice/widget/form_view.dart';
import 'package:ui_components/theme/app_theme.dart';

void main() {
  group('Invoice form tests', () {
    testWidgets('Invoice form test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: ThemeMode.light,
          home: Material(
            child: Scaffold(
              body: Center(
                child: FormView(
                  onFormChanged: (_) {},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(FormView),
        matchesGoldenFile('golden/invoice_form.png'),
      );
    });
    testWidgets('Invoice form test in dark', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: ThemeMode.dark,
          home: Material(
            child: Scaffold(
              body: Center(
                child: FormView(
                  onFormChanged: (_) {},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(FormView),
        matchesGoldenFile('golden/dark_invoice_form.png'),
      );
    });
  });
}
