import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppInvoiceListItem',
  type: AppInvoiceListItem,
)
Widget appInvoiceListItem(BuildContext context) {
  return Container(
    color: context.colors.background,
    child: Center(
      child: AppInvoiceListItem(
        id: context.knobs.string(label: 'Id', initialValue: '123456'),
        clientName: context.knobs
            .string(label: 'Client Name', initialValue: 'John Doe'),
        date: context.knobs
            .dateTime(
                label: 'Date',
                initialValue: DateTime.now(),
                start: DateTime(2020),
                end: DateTime(2025))
            .toSimpleFormat(),
        total:
            '£ ${context.knobs.double.input(label: 'Total', initialValue: 100.0)}',
        status: context.knobs.list(
            label: 'Status',
            options: AppInvoiceStatus.values,
            labelBuilder: (value) => value.toString().split('.').last),
      ),
    ),
  );
}
