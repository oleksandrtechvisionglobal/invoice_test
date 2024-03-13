import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_components/theme/app_theme.dart';
import 'package:ui_components/widgets/app_invoice_list_item.dart';
import 'package:ui_components/widgets/app_invoice_status_label.dart';

void main() {
  group('Invoice List Item tests', () {
    testWidgets('Invoice List Item paid test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppInvoiceListItem(
                id: '1',
                date: '01/01/2021',
                clientName: 'Client Name',
                total: 'R\$ 100,00',
                status: AppInvoiceStatus.paid),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppInvoiceListItem),
        matchesGoldenFile('snapshots/invoice_list_item.png'),
      );
    });

    testWidgets('Invoice List Item draft test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme().lightTheme,
          home: Scaffold(
            body: AppInvoiceListItem(
                id: '1',
                date: '01/01/2021',
                clientName: 'Client Name',
                total: 'R\$ 100,00',
                status: AppInvoiceStatus.draft),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(AppInvoiceListItem),
        matchesGoldenFile('snapshots/invoice_list_item_overdue.png'),
      );
    });
  });
}
