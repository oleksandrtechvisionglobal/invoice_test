import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppTextField',
  type: AppTextField,
)
Widget appTextField(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextField(
          controller: TextEditingController(),
          hintText: context.knobs
              .string(label: 'Hint Text', initialValue: 'Hint Text'),
        ),
      ),
    ),
  );
}
