import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import '../gen/assets.gen.dart';
import '../tokens/app_typography.dart';

class AppButton extends StatelessWidget {
  final String text;
  final AppButtonStyle style;
  final VoidCallback? onPressed;

  const AppButton({
    Key? key,
    required this.text,
    required this.style,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return style.backgroundColor(context, states);
          }),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: style == AppButtonStyle.stretchedButton
              ? MainAxisSize.max
              : MainAxisSize.min,
          children: [
            if (style == AppButtonStyle.iconButton)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Assets.icons.addButtonIcon.svg(
                  package: 'ui_components',
                  height: 32,
                  width: 32,
                ),
              ),
            Padding(
              padding: style.textPadding(),
              child: Text(
                text,
                style: style.textStyle(context),
              ),
            ),
          ],
        ));
  }
}

enum AppButtonStyle {
  primary,
  secondary,
  darkButton,
  iconButton,
  danger,
  stretchedButton;

  Color backgroundColor(BuildContext context, Set<MaterialState> states) {
    switch (this) {
      case AppButtonStyle.primary:
        return states.contains(MaterialState.hovered)
            ? context.colors.buttonSecondary
            : context.colors.buttonPrimary;
      case AppButtonStyle.secondary:
        return states.contains(MaterialState.hovered)
            ? context.colors.buttonSecondaryHoverColor
            : context.colors.buttonSecondaryColor;
      case AppButtonStyle.iconButton:
        return states.contains(MaterialState.hovered)
            ? context.colors.buttonSecondary
            : context.colors.buttonPrimary;
      case AppButtonStyle.darkButton:
        return states.contains(MaterialState.hovered)
            ? context.colors.darkButtonHoverColor
            : context.colors.darkButtonColor;
      case AppButtonStyle.danger:
        return states.contains(MaterialState.hovered)
            ? context.colors.dangerHoverColor
            : context.colors.dangerColor;
      case AppButtonStyle.stretchedButton:
        return states.contains(MaterialState.hovered)
            ? context.colors.textButtonSecondaryColor
            : context.colors.stretchedButtonColor;
    }
  }

  TextStyle textStyle(BuildContext context) {
    switch (this) {
      case AppButtonStyle.primary:
        return AppTypography.headingSVariant(context.colors.textButtonWhite);
      case AppButtonStyle.secondary:
        return AppTypography.headingSVariant(context.colors.inputHint);
      case AppButtonStyle.iconButton:
        return AppTypography.headingSVariant(context.colors.textButtonWhite);
      case AppButtonStyle.darkButton:
        return AppTypography.headingSVariant(
            context.colors.textDarkButtonColor);
      case AppButtonStyle.danger:
        return AppTypography.headingSVariant(context.colors.textButtonWhite);
      case AppButtonStyle.stretchedButton:
        return AppTypography.headingSVariant(context.colors.textDialogContent);
    }
  }

  EdgeInsetsGeometry textPadding() {
    switch (this) {
      case AppButtonStyle.primary:
        return EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 18);

      case AppButtonStyle.secondary:
        return EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 18);

      case AppButtonStyle.iconButton:
        return EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 18);
      case AppButtonStyle.darkButton:
        return EdgeInsets.only(left: 24, right: 16, bottom: 15, top: 18);

      case AppButtonStyle.danger:
        return EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 18);
      case AppButtonStyle.stretchedButton:
        return EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 18);
    }
  }
}
