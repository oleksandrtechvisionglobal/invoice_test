import 'package:flutter/material.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final String cancelButtonText;
  final AppButtonStyle cancelButtonStyle;
  final AppButtonStyle confirmButtonStyle;

  const AppDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.cancelButtonStyle,
    required this.confirmButtonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.inputBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTypography.headingM(context.colors.textPrimary),
            ),
            SizedBox(height: 8),
            Text(content,
                style: AppTypography.body(context.colors.textDialogContent)),
            SizedBox(height: 22),
            Row(
              children: [
                const Spacer(),
                AppButton(
                  text: cancelButtonText,
                  style: cancelButtonStyle,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                const SizedBox(width: 8),
                AppButton(
                  text: confirmButtonText,
                  style: confirmButtonStyle,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
