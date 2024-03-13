import 'package:flutter/material.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

class AppInvoiceStatusLabel extends StatelessWidget {
  final AppInvoiceStatus status;

  const AppInvoiceStatusLabel({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: status.backgroundColor(context),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status.textColor(context),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              status.label,
              style: AppTypography.headingSVariant(status.textColor(context)),
            ),
          ],
        ),
      ),
    );
  }
}

enum AppInvoiceStatus {
  paid,
  pending,
  draft;

  Color textColor(BuildContext context) {
    switch (this) {
      case AppInvoiceStatus.paid:
        return context.colors.invoiceStatusPaid;
      case AppInvoiceStatus.pending:
        return context.colors.invoiceStatusPending;
      case AppInvoiceStatus.draft:
        return context.colors.invoiceStatusDraft;
    }
  }

  Color backgroundColor(BuildContext context) {
    switch (this) {
      case AppInvoiceStatus.paid:
        return context.colors.invoiceStatusPaid.withOpacity(0.0571);
      case AppInvoiceStatus.pending:
        return context.colors.invoiceStatusPending.withOpacity(0.0571);
      case AppInvoiceStatus.draft:
        return context.colors.invoiceStatusDraft.withOpacity(0.0571);
    }
  }

  String get label {
    switch (this) {
      case AppInvoiceStatus.paid:
        return 'Paid';
      case AppInvoiceStatus.pending:
        return 'Pending';
      case AppInvoiceStatus.draft:
        return 'Draft';
    }
  }
}
