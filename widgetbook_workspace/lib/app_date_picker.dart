import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppDatePicker',
  type: AppDatePicker,
)
Widget appDatePicker(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppDatePicker(
          hintText: context.knobs
              .string(label: 'Hint Text', initialValue: 'Hint Text'),
          initialDate: context.knobs.dateTime(
            start: DateTime.now().subtract(const Duration(days: 365)),
            label: 'Initial Date',
            initialValue: DateTime.now(),
            end: DateTime.now().add(const Duration(days: 365)),
          ),
          enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
        ),
      ),
    ),
  );
}
