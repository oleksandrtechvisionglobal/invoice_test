import 'package:flutter/material.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_typography.dart';

class AppFormGroupLabel extends StatelessWidget {
  final String label;
  final bool? itemsLabel;

  const AppFormGroupLabel({
    Key? key,
    required this.label,
    this.itemsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = itemsLabel ?? false
        ? AppTypography.itemsTitle(context.colors.textFieldDisabledColor)
        : AppTypography.headingSVariant(context.colors.groupLabelColor);
    return Text(
      label,
      style: style,
    );
  }
}
