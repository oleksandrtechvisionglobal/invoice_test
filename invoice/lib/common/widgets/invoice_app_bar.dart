import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/providers/theme_provider.dart';
import 'package:ui_components/ui_components.dart';

class InvoiceAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const InvoiceAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateProvider);
    return AppAppBar(
      onThemeModeChanged: (themeMode) {
        ref.read(appThemeStateProvider.notifier).switchTheme();
      },
      themeMode: appThemeState,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
