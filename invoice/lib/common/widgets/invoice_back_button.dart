import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice/gen/assets.gen.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_typography.dart';

class InvoiceBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const InvoiceBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onPressed ?? () => context.pop(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.backIcon.svg(),
              const SizedBox(width: 23),
              Text(
                'Go back',
                style:
                    AppTypography.headingSVariant(context.colors.textPrimary),
              ),
            ],
          ),
          const SizedBox(height: 33),
        ],
      ),
    );
  }
}
