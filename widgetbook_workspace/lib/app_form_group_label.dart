import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppFormGroupLabel',
  type: AppFormGroupLabel,
)
Widget appFormGroupLabel(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: AppFormGroupLabel(
        label: context.knobs.string(label: 'Label', initialValue: 'Label'),
      ),
    ),
  );
}
