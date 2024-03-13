import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_components/ui_components.dart';

import 'providers/shared_preferences_provider.dart';
import 'routers/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  final _router = AppRoutes();

  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateProvider);
    return MaterialApp.router(
      title: 'Invoice',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: appThemeState,
      routerConfig: _router.r,
    );
  }
}
