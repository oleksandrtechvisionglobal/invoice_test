import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_button.dart';

void main() {
  group('Button tests', () {
    testWidgets('Primary button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.primary,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/primary_button.png'),
      );
    });

    testWidgets('Secondary button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.secondary,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/secondary_button.png'),
      );
    });

    testWidgets('Secondary in dark theme button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: ThemeMode.dark,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.secondary,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/secondary_dark_button.png'),
      );
    });

    testWidgets('Dark button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.darkButton,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/dark_button.png'),
      );
    });

    testWidgets('Dark button in dark theme test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().darkTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.darkButton,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/dark_dark_button.png'),
      );
    });

    testWidgets('Icon button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.iconButton,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/icon_button.png'),
      );
    });

    testWidgets('Danger button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.danger,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/danger_button.png'),
      );
    });

    testWidgets('Stretched button test, ', (tester) async {
      await loadAppFonts();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Material(
            child: Scaffold(
              body: Center(
                child: AppButton(
                  text: 'Button',
                  onPressed: () {},
                  style: AppButtonStyle.stretchedButton,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('snapshots/stretched_button.png'),
      );
    });
  });
}
