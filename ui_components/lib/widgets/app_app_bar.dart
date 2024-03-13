import 'package:flutter/material.dart';
import 'package:ui_components/gen/assets.gen.dart';
import 'package:ui_components/ui_components.dart';

class AppAppBar extends StatelessWidget {
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final ThemeMode themeMode;

  const AppAppBar({
    Key? key,
    required this.onThemeModeChanged,
    required this.themeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: context.colors.appBarBackground,
      child: Row(
        children: [
          Assets.icons.appBarIcon.svg(
            width: 72,
            height: 72,
            package: 'ui_components',
          ),
          Spacer(),
          IconButton(
            icon: themeMode == ThemeMode.light
                ? Assets.icons.moon.svg(
                    width: 20,
                    height: 20,
                    package: 'ui_components',
                  )
                : Assets.icons.light.svg(
                    width: 20,
                    height: 20,
                    package: 'ui_components',
                  ),
            onPressed: () {
              onThemeModeChanged(
                themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
          const SizedBox(width: 27),
          AppDivider(isVertical: true),
          const SizedBox(width: 27),
          Assets.images.avatar.image(
            package: 'ui_components',
          ),
          const SizedBox(width: 27),
        ],
      ),
    );
  }
}
