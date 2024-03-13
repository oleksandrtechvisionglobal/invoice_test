import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/providers/shared_preferences_provider.dart';
import 'package:invoice/providers/theme_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}
void main() {
  late final ProviderContainer container;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final prefsInstance = await SharedPreferences.getInstance();

    container = createContainer(overrides: [
      sharedPreferencesProvider.overrideWithValue(prefsInstance),
    ]);
  });

  group('Theme Provider test', () {
    test('Theme switching is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final themeProvider = container.read(appThemeStateProvider.notifier);
      themeProvider.switchTheme();
      expect(themeProvider.state, equals(ThemeMode.dark));
    });
  });
}