import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_components/tokens/app_paddings.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

class AppTextField extends StatelessWidget {
  final bool? enabled;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputType;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.enabled,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = enabled ?? true
        ? AppTypography.headingSVariant(context.colors.textPrimary)
        : AppTypography.headingSVariant(context.colors.textFieldDisabledColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hintText,
          style: AppTypography.body(context.colors.inputHint),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 48,
          child: TextField(
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: inputType != null ? TextInputType.number : null,
            cursorColor: context.colors.cursorColor,
            style: textStyle,
            inputFormatters: inputType,
            decoration: InputDecoration(
              fillColor: enabled ?? true
                  ? context.colors.inputBackground
                  : context.colors.transparent,
              filled: true,
              focusColor: context.colors.transparent,
              hoverColor: context.colors.transparent,
              contentPadding: AppPaddings.input,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.borderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.borderColorActive,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
