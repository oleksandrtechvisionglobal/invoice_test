import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppDialog',
  type: AppDialog,
)
Widget appDivider(BuildContext context) {
  final String title =
      context.knobs.string(label: 'Title', initialValue: 'Dialog Title');
  final String content =
      context.knobs.string(label: 'Content', initialValue: 'Dialog Content');
  final String confirmButtonText = context.knobs
      .string(label: 'Confirm Button Text', initialValue: 'Confirm');
  final String cancelButtonText =
      context.knobs.string(label: 'Cancel Button Text', initialValue: 'Cancel');
  final AppButtonStyle cancelButtonStyle = context.knobs.list(
    label: 'Cancel Button Style',
    options: AppButtonStyle.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );
  final AppButtonStyle confirmButtonStyle = context.knobs.list(
    label: 'Confirm Button Style',
    options: AppButtonStyle.values,
    labelBuilder: (value) => value.toString().split('.').last,
  );
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
          text: 'Show Dialog',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AppDialog(
                title: title,
                content: content,
                confirmButtonText: confirmButtonText,
                cancelButtonText: cancelButtonText,
                cancelButtonStyle: cancelButtonStyle,
                confirmButtonStyle: confirmButtonStyle,
              ),
            );
          },
          style: AppButtonStyle.primary,
        ),
      ),
    ),
  );
}
