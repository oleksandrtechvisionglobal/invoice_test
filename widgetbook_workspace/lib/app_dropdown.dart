import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppDropdown',
  type: AppDropdown,
)
Widget appDropdown(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppDropdown(
          hintText: context.knobs
              .string(label: 'Hint Text', initialValue: 'Hint Text'),
          items: [
            'Item 1',
            'Item 2',
            'Item 3',
          ],
          initialValue: 'Item 1',
        ),
      ),
    ),
  );
}
