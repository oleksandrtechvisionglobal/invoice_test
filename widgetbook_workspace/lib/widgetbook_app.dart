import 'package:flutter/material.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook/widgetbook.dart';
import 'widgetbook_app.directories.g.dart';

@widgetbook.App()
class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: Devices.all,
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppTheme().lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: AppTheme().darkTheme,
            ),
          ],
          themeBuilder: (context, theme, child) {
            return Theme(data: theme, child: child);
          },
        ),
      ],
    );
  }
}
