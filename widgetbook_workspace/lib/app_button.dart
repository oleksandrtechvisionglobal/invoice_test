import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppButton',
  type: AppButton,
)
Widget appButton(BuildContext context) {
  final style = context.knobs.list(
    label: 'Style',
    options: AppButtonStyle.values,
    labelBuilder: (AppButtonStyle style) => style.toString().split('.').last,
  );
  return Center(
    child: AppButton(
      text: context.knobs.string(label: 'Text', initialValue: 'Button'),
      style: style,
      onPressed: () {},
    ),
  );
}
