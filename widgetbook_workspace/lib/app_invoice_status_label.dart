import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppInvoiceStatusLabel',
  type: AppInvoiceStatusLabel,
)
Widget appInvoiceStatusLabel(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: context.colors.background,
    child: Center(
      child: AppInvoiceStatusLabel(
        status: context.knobs.list(
            label: 'Status',
            options: AppInvoiceStatus.values,
            labelBuilder: (value) => value.toString().split('.').last),
      ),
    ),
  );
}
