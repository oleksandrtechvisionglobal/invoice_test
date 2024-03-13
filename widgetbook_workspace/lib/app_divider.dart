import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppDivider',
  type: AppDivider,
)
Widget appDivider(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppDivider(
          isVertical:
              context.knobs.boolean(label: 'Is Vertical', initialValue: false),
        ),
      ),
    ),
  );
}
