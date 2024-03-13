import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AppScroll',
  type: AppScroll,
)
Widget appScroll(BuildContext context) {
  final ScrollController controller = ScrollController();
  return Container(
    color: context.colors.background,
    child: Center(
      child: AppScroll(
        controller: controller,
        child: ListView.separated(
          controller: controller,
          itemBuilder: (context, index) => AppInvoiceListItem(
            id: '123456',
            clientName: 'John Doe',
            date: DateTime.now().toSimpleFormat(),
            total: '£ 100.0',
            status: AppInvoiceStatus.paid,
          ),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemCount: 100,
        ),
      ),
    ),
  );
}
