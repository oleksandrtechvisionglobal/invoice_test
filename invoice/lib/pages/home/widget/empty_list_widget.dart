import 'package:flutter/material.dart';
import 'package:invoice/gen/assets.gen.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.emptyListImage.svg(),
        const SizedBox(height: 42),
        Text(
          'There is nothing here',
          style: AppTypography.headingM(context.colors.textPrimary),
        ),
        const SizedBox(height: 23),
        Text(
          'Create an invoice by clicking the\nNew button and get started',
          textAlign: TextAlign.center,
          style: AppTypography.body(context.colors.textPrefixColor),
        ),
      ],
    );
  }
}
